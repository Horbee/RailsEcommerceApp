const { createStore } = window.Redux;

const initState = {
  line_items: []
}
var line_items = [];

function myreducer(state = initState, action) {
  if (action.type == 'SEND_ADD_CART_LINE_ITEM') { 
    handleSubmit(action.product_id);
    return {
      ...state
    }
  }

  if (action.type == 'ADD_CART_LINE_ITEM_ID') {

    var found = false;

    state.line_items.map(item => {
      if (item.product_id == action.cart_line_item.product_id) {
        item.quantity += 1;
        found = true;
      }
    });

    if (found) {
      return {
        ...state
      }
    } else {
      return {
        line_items: [...state.line_items, action.cart_line_item]
      }
    }

  }

  if (action.type == 'REMOVE_CART_LINE_ITEM') {
    handleDelete(action.cli_id);
    var newList = state.line_items.filter(item => {
      if (item.id === action.cli_id) {
        item.quantity -= 1;
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
//store.subscribe(() => {
  //console.log("global state is updated")
//});

function getFetch() {
  fetch('/api/v1/carts.json')
    .then((response) => {return response.json()})
    .then((data) => {
      store.dispatch({ type: 'INITIAL_DATA', data: data});
    });
}

function handleDelete(id){
  const token = $('meta[name="csrf-token"]').attr('content');

  fetch(`/api/v1/carts/${id}`, 
  {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': token
    }
  }).then((response) => { 
    return response
  })
}

function handleSubmit(product_id){
  const token = $('meta[name="csrf-token"]').attr('content');
  let body = JSON.stringify({id: product_id })
  
  fetch('/api/v1/carts', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': token
    },
    body: body,
  }).then((response) => {return response.json()})
    .then((cart_line_item)=>{
      store.dispatch({ type: 'ADD_CART_LINE_ITEM_ID', cart_line_item: cart_line_item});
    })

}
