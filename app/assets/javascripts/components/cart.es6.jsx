class Cart extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      products: [
        {id: 1, name: "Awesome Laptop", price: 570},
        {id: 2, name: "Beast Laptop", price: 370},
        {id: 3, name: "Poor Laptop", price: 70}
      ]
    };
  }

  render () {
    return (
      <div className="cart-content">
        <p className="cart-title text-center">3 Items in your Cart</p>
        <div className="dropdown-divider"></div>
        <p className='text-muted text-center'>Click on Checkout to finish shopping
          <ul className="list-group">
            <li className="list-group-item list-group-item-light">
              <span className="item-name">{this.state.products[0].name}</span>
              <span className="float-right">${this.state.products[0].price}</span>
            </li>
            <li className="list-group-item list-group-item-light">
              <span className="item-name">{this.state.products[1].name}</span>
              <span className="float-right">${this.state.products[1].price}</span>
            </li>
            <li className="list-group-item list-group-item-light">
              <span className="item-name">{this.state.products[2].name}</span>
              <span className="float-right">${this.state.products[2].price}</span>
            </li>
          </ul>
        </p>
        <div className="dropdown-divider"></div>
        <p className="cart-total font-weight-bold float-left">TOTAL</p>
        <p className="cart-value float-right text-right">$500</p>
        <div className="clearfix"></div>
        <div className="dropdown-divider"></div>
        <a href="/simple_pages/cart" className="btn btn-success btn-block">CHECKOUT</a>
      </div>
    );
  }
}


