class Cart extends React.Component {

  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this)
  }

 
  componentDidMount(){
    getData(); // function in the store

    store.subscribe(() => {
      this.refresh();
    });

  }

  refresh() { this.setState({ products: [] }); }
  
  handleDelete(cliId){ 
    if (this.props.checkout)
      return //on the actual checkout page you cannot delete items by clicking on the name
      
    store.dispatch({ type: 'REMOVE_CART_LINE_ITEM', cliId: cliId});
  }

  render () {
    var checkoutPrice = 0; 
    var lineItemLength = 0;

    // partial for the CLIs
    if(typeof store.getState() !== "undefined") {
      //console.log(store.getState());
      var items = store.getState().lineItems.map((cli) => {
        checkoutPrice += cli.totalPrice;
        return(
          <li className="list-group-item list-group-item-light" key={cli.id}>
            <span className={this.props.checkout ? "" : "item-name"} onClick={() => this.handleDelete(cli.id)}>{cli.productName}</span>
            <br /><span>#{cli.quantity}</span>
            <span className="float-right">${cli.totalPrice * 0.01}</span>
          </li>
        )
      });
      lineItemLength = store.getState().lineItems.length;
    }
    // end of the CLI partials

    checkoutBtn = <button onClick={beforeCheckOut} className="btn btn-success btn-block">CHECKOUT</button>
    
    return (
      <div className="cart-content">
        <p className="cart-title text-center">{lineItemLength} Product(s) in your Cart</p>
        <div className="dropdown-divider"></div>
        <p className='text-muted text-center'>{lineItemLength ? "Click on Checkout to finish shopping" : "Your cart is empty"}</p>
        
        <ul className="list-group">
          {items}            
        </ul>
        
        <div className="dropdown-divider"></div>
        <p className="cart-total font-weight-bold float-left">TOTAL</p>
        <p className="cart-value float-right text-right">${checkoutPrice * 0.01}</p>
        <div className="clearfix"></div>
        <div className="dropdown-divider"></div>
        {this.props.checkout ? "" : checkoutBtn }      
      </div>
    );
  }
}

