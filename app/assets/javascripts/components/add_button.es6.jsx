class AddButton extends React.Component {
  
  constructor(props) {
    super(props);

    this.handleFormSubmit = this.handleFormSubmit.bind(this)
  }
  
  handleFormSubmit(e){
    const token = $('meta[name="csrf-token"]').attr('content');

    let body = JSON.stringify({id: this.props.product_id })
    
    fetch('http://localhost:3000/api/v1/carts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
      },
      body: body,
    }).then((response) => {return response.json()})
    .then((product)=>{
      console.log(this.props.product_id);
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