const { createStore } = window.Redux;

const initState = {
  line_items: []
}
var line_items = [];
var changed = false;

function myreducer(state = initState, action) {
  if (action.type == 'SEND_ADD_CART_LINE_ITEM') {
    changed = true;
    var found = false;
    var cli = {};
    var id = 0;
    state.line_items.map(item => {
      if (parseInt(item.id) >= id) id = parseInt(item.id) + 1;

      if (item.productId == action.product.id) {
        item.quantity += 1;
        item.totalPrice += action.product.price;
        found = true;
      }

    });

    if (found) {
      return {
        ...state
      }
    } else {
      cli = { id: id, productId: action.product.id, productName: action.product.name, quantity: 1, totalPrice: action.product.price }
      return {
        line_items: [...state.line_items, cli]
      }
    }

  }

  if (action.type == 'REMOVE_CART_LINE_ITEM') {
    changed = true;
    var newList = state.line_items.filter(item => {
      if (item.id === action.cli_id) {
        var prodPrice = item.totalPrice / item.quantity;
        item.quantity -= 1;
        item.totalPrice -= prodPrice;
        if (item.quantity <= 0) {
          return false;
        } 
      }
      return true;
    })

    return {
      line_items: newList
    }
  }

  if (action.type == 'INITIAL_DATA') {
    line_items = action.data;
    return {
      ...state,
      line_items: line_items
    }
  }
}

const store = createStore(myreducer);

function getData() {
    queryString = `{
      cartLineItems {
        id
        productName
        quantity
        totalPrice
        productId
      }
    }`;

    makeGraphQL(queryString)
      .then((data)=>{ store.dispatch({ type: 'INITIAL_DATA', data: data.data.cartLineItems}) })
}

function makeGraphQL(query) {
  const token = $('meta[name="csrf-token"]').attr('content');
  let body = JSON.stringify(query);
  
  return fetch('/graphql', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': token
    },
    body: body,
  }).then((response) => { return response.json(); })
}

$( document ).on('turbolinks:request-start', function() {
  if(!changed) return;

  deleteString = `mutation {
    deleteCurrentClis
  }`;

  makeGraphQL(deleteString)
    .then((data)=>{ /*console.log(data)*/ })


  if (store.getState().line_items) {
    const createCli = (item) => {
      const alias = `alias_${Math.random().toString(36).slice(2)}`
    
      return `
        ${alias}: createCli(productId: ${item.productId}, quantity: ${item.quantity}) {
          id
        }
      `
    }
    
    const createClis = (mutations) => {
      const joinedMutations = mutations.join('\n')
      
      return `
      mutation createClis {
        ${joinedMutations}
      }
      `
    }
    
    const mutations  = store.getState().line_items.map(item => createCli(item))
    const createMutation = createClis(mutations)

    makeGraphQL(createMutation)
      .then((data)=>{ /*console.log(data)*/ })
  }
  
  changed = false;
});
