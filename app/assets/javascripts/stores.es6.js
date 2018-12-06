const { createStore } = window.Redux;

const initState = {
  line_item_ids: []
}
var ids = [];

function myreducer(state = initState, action) {
  if (action.type == 'ADD_CART_LINE_ITEM_ID') {
    if (!ids[0].includes(action.id)) 
      ids.push(action.id)
    
    return { line_item_ids: ids }  
  }

  if (action.type == 'INITIAL_DATA') {
    //console.log(action.data[0].id);
    ids.push(action.data.map(product => product.id));
    //console.log(ids);
    return {
      line_item_ids: ids
    }
  }
}

const store = createStore(myreducer);
store.subscribe(() => {
  console.log("global state is updated")
});

//store.dispatch({ type: 'ADD_TODO', todo: 'buy milk'});
//store.dispatch({type: 'ADD_TODO', todo: 'buy more milk'})
//store.dispatch({type: 'ADD_TODO', todo: 'sleep some more'})
//store.dispatch({type: 'ADD_POST', post: 'egg hunt with yoshi'})