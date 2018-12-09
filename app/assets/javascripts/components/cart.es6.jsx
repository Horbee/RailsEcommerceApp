class Cart extends React.Component {

  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this)
  }

 
  componentDidMount(){
    fetch('/api/v1/carts.json')
        .then((response) => {return response.json()})
        .then((data) => {
          //this.setState({ products: data });
          //store.dispatch({ type: 'INITIAL_DATA', data: this.state.products});
          store.dispatch({ type: 'INITIAL_DATA', data: data});
        });
    
    store.subscribe(() => {
      this.refresh();
    });

  }

  refresh() {
    this.setState({ products: [] });
  }
  
  handleDelete(id){
    if (this.props.checkout)
      return 
    store.dispatch({ type: 'REMOVE_CART_LINE_ITEM', cli_id: id});
  }

  render () {
    var price = 0;
    var line_item_length = 0;

    if(typeof store.getState() !== "undefined") {
      var products = store.getState().line_items.map((product) => {
        price += product.total_price;
        return(
          <li className="list-group-item list-group-item-light" key={product.id}>
            <span className={this.props.checkout ? "" : "item-name"} onClick={() => this.handleDelete(product.id)}>{product.product_name}</span>
            <br /><span>#{product.quantity}</span>
            <span className="float-right">${product.total_price * 0.01}</span>
          </li>
        )
      });
      line_item_length = store.getState().line_items.length;
    }

    checkout_btn = <a href="/simple_pages/cart" className="btn btn-success btn-block">CHECKOUT</a>
    
    return (
      <div className="cart-content">
        <p className="cart-title text-center">{line_item_length} Product(s) in your Cart</p>
        <div className="dropdown-divider"></div>
        <p className='text-muted text-center'>{line_item_length ? "Click on Checkout to finish shopping" : "Your cart is empty"}</p>
        
        <ul className="list-group">
          {products}            
        </ul>
        
        <div className="dropdown-divider"></div>
        <p className="cart-total font-weight-bold float-left">TOTAL</p>
        <p className="cart-value float-right text-right">${price * 0.01}</p>
        <div className="clearfix"></div>
        <div className="dropdown-divider"></div>
        {this.props.checkout ? "" : checkout_btn }      
      </div>
    );
  }
}

