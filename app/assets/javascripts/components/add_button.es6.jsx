class AddButton extends React.Component {
  
  constructor(props) {
    super(props);

    this.handleFormSubmit = this.handleFormSubmit.bind(this)
  }
  
  handleFormSubmit(e){
    e.preventDefault();
    store.dispatch({ type: 'SEND_ADD_CART_LINE_ITEM', product_id: this.props.product_id});
  }

  render() {
    return(
      <form onSubmit={this.handleFormSubmit}>
        <button className="btn btn-success btn-block addbutton">Add to Cart</button>
      </form>
    );
  }
}