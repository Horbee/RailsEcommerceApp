class Cart extends React.Component {

  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this)
  }

 
  componentDidMount(){
    getData(); // it's a function in the store

    store.subscribe(() => {
      this.refresh();
    });

  }

  refresh() {
    this.setState({ products: [] });
  }
  
  handleDelete(id){ //this is the cli_id
    if (this.props.checkout)
      return //on the actual checkout page
      
    store.dispatch({ type: 'REMOVE_CART_LINE_ITEM', cli_id: id});
  }

  render () {
    var checkoutPrice = 0; 
    var line_item_length = 0;

    // partial for the CLIs
    if(typeof store.getState() !== "undefined") {
      //console.log(store.getState());
      var items = store.getState().line_items.map((cli) => {
        checkoutPrice += cli.totalPrice;
        return(
          <li className="list-group-item list-group-item-light" key={cli.id}>
            <span className={this.props.checkout ? "" : "item-name"} onClick={() => this.handleDelete(cli.id)}>{cli.productName}</span>
            <br /><span>#{cli.quantity}</span>
            <span className="float-right">${cli.totalPrice * 0.01}</span>
          </li>
        )
      });
      line_item_length = store.getState().line_items.length;
    }
    // end of the CLI partials

    checkout_btn = <a href="/simple_pages/cart" className="btn btn-success btn-block">CHECKOUT</a>
    
    return (
      <div className="cart-content">
        <p className="cart-title text-center">{line_item_length} Product(s) in your Cart</p>
        <div className="dropdown-divider"></div>
        <p className='text-muted text-center'>{line_item_length ? "Click on Checkout to finish shopping" : "Your cart is empty"}</p>
        
        <ul className="list-group">
          {items}            
        </ul>
        
        <div className="dropdown-divider"></div>
        <p className="cart-total font-weight-bold float-left">TOTAL</p>
        <p className="cart-value float-right text-right">${checkoutPrice * 0.01}</p>
        <div className="clearfix"></div>
        <div className="dropdown-divider"></div>
        {this.props.checkout ? "" : checkout_btn }      
      </div>
    );
  }
}

