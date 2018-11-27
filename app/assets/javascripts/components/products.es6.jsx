const Products = ({products}) => {
  const productList = this.state.products.map(product => {
    <li className="list-group-item list-group-item-light">
      <span className="item-name">{product.name}</span>
      <span className="float-right">${product.price}</span>
    </li>
  });

  return(
    {productList}
  );
}