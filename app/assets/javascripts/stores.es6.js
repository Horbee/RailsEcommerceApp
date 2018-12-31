const { createStore } = window.Redux;

const initState = {
  lineItems: []
}
var lineItems = [];
var changed = false;

function myReducer(state = initState, action) {
  if (action.type == 'ADD_CART_LINE_ITEM') {
    changed = true;
    var found = false;
    var cli = {};
    var newId = 0;
    state.lineItems.map(item => {
      if (parseInt(item.id) >= newId) newId = parseInt(item.id) + 1;

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
      cli = { id: newId, productId: action.product.id, productName: action.product.name, quantity: 1, totalPrice: action.product.price }
      return {
        lineItems: [...state.lineItems, cli]
      }
    }

  }

  if (action.type == 'REMOVE_CART_LINE_ITEM') {
    changed = true;
    var newList = state.lineItems.filter(item => {
      if (item.id === action.cliId) {
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
      lineItems: newList
    }
  }

  if (action.type == 'INITIAL_DATA') {
    lineItems = action.data;
    return {
      ...state,
      lineItems: lineItems
    }
  }
}

const store = createStore(myReducer);

function getData() {
    //grabbing the data from db
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

function beforeCheckOut() {
  if (changed) saveItems().then((data)=>{ window.location.href = "/simple_pages/cart" });
  else window.location.href = "/simple_pages/cart"
}

function saveItems() {
  if(!changed) return;

  deleteString = `mutation {
    deleteCurrentClis
  }`;

  makeGraphQL(deleteString)

  if (store.getState().lineItems) {
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
    
    const mutations  = store.getState().lineItems.map(item => createCli(item))
    const createMutation = createClis(mutations)

    return makeGraphQL(createMutation);
  }
  
  changed = false;
}

$( document ).on('turbolinks:request-start', function() {  saveItems(); });
