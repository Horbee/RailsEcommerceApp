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
    this.refresh();
    
    // this.interval = setInterval(() => {
      
      
    //     this.setState({ time: Date.now() });
      
    //   }, 1000);

  }

  refresh() {
    fetch('/api/v1/carts.json')
        .then((response) => {return response.json()})
        .then((data) => {this.setState({ products: data }) });
  }
  
  componentWillUnmount() {
    clearInterval(this.interval);
  }

  handleDelete(id){
    const token = $('meta[name="csrf-token"]').attr('content');

    fetch(`http://localhost:3000/api/v1/carts/${id}`, 
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
    // newProducts = this.state.products.filter((product) => {
    //   if (product.id == id) {
    //     console.log("now")
    //     console.log(product.quantity)
    //     product.quantity -= 1;
    //     return true;
    //   }
    //   product.id !== id
    // });
    
    // this.setState({
    //   products: newProducts
    // })
  }

  render () {
    var price = 0;
    var products = this.state.products.map((product) => {
      price += product.total_price;
      return(
        <li className="list-group-item list-group-item-light" key={product.id}>
          <span className="item-name" onClick={() => this.handleDelete(product.id)}>{product.product_name}</span>
          <br /><span>#{product.quantity}</span>
          <span className="float-right">${product.total_price}</span>
        </li>
      )
    });

    return (
      <div className="cart-content">
        <p className="cart-title text-center">{this.state.products.length} Items in your Cart</p>
        <div className="dropdown-divider"></div>
        <p className='text-muted text-center'>Click on Checkout to finish shopping</p>
        
        <ul className="list-group">
          {products}            
        </ul>
        
        <div className="dropdown-divider"></div>
        <p className="cart-total font-weight-bold float-left">TOTAL</p>
        <p className="cart-value float-right text-right">${price}</p>
        <div className="clearfix"></div>
        <div className="dropdown-divider"></div>
        <a href={this.props.checkout ? "/" : "/simple_pages/cart"} className="btn btn-success btn-block">CHECKOUT</a>
      </div>
    );
  }
}

