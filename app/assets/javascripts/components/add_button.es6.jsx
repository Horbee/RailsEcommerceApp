class AddButton extends React.Component {
  
  constructor(props) {
    super(props);

    this.handleFormSubmit = this.handleFormSubmit.bind(this)
  }
  
  handleFormSubmit(e){
    e.preventDefault();
    const token = $('meta[name="csrf-token"]').attr('content');

    let body = JSON.stringify({id: this.props.product_id })
    
    fetch('/api/v1/carts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
      },
      body: body,
    }).then((response) => {return response.json()})
    .then((cart_line_item)=>{
      //console.log(this.props.product_id);
      //console.log(cart_line_item.id)
      store.dispatch({ type: 'ADD_CART_LINE_ITEM_ID', id: cart_line_item.id});
    })

  }

  render() {
    return(
      <form onSubmit={this.handleFormSubmit}>
        <button className="btn btn-success btn-block">Add to Cart</button>
      </form>
    );
  }
}