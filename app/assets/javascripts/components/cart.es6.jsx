class Cart extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      products: [],
    };
    this.handleDelete = this.handleDelete.bind(this)
    this.deleteProduct = this.deleteProduct.bind(this)
  }

 
  componentDidMount(){
    fetch('/api/v1/carts.json')
        .then((response) => {return response.json()})
        .then((data) => {
          this.setState({ products: data });
          store.dispatch({ type: 'INITIAL_DATA', data: this.state.products});
        });
    
    store.subscribe(() => {
      console.log("i got this");
      this.refresh();
    });
    
  }

  refresh() {
    fetch('/api/v1/carts.json')
        .then((response) => {return response.json()})
        .then((data) => { this.setState({ products: data }) });
  }
  
  handleDelete(id){
    const token = $('meta[name="csrf-token"]').attr('content');

    fetch(`/api/v1/carts/${id}`, 
    {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
      }
    }).then((response) => { 
      this.deleteProduct(id)
    })
  }

  deleteProduct(id){
    this.refresh();
  }

  render () {
    var price = 0;
    var products = this.state.products.map((product) => {
      price += product.total_price;
      return(
        <li className="list-group-item list-group-item-light" key={product.id}>
          <span className="item-name" onClick={() => this.handleDelete(product.id)}>{product.product_name}</span>
          <br /><span>#{product.quantity}</span>
          <span className="float-right">${product.total_price * 0.01}</span>
        </li>
      )
    });

    checkout_btn = <a href="/simple_pages/cart" className="btn btn-success btn-block">CHECKOUT</a>
    
    return (
      <div className="cart-content">
        <p className="cart-title text-center">{this.state.products.length} Product(s) in your Cart</p>
        <div className="dropdown-divider"></div>
        <p className='text-muted text-center'>{this.state.products.length ? "Click on Checkout to finish shopping" : "Your cart is empty"}</p>
        
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

