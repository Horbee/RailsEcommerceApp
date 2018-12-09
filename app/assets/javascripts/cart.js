$( document ).on('turbolinks:load', function() {
  $('#cart-icon').on('click', function() {
    //alert("clicked")
    var element = $('.fixed-cart');

    if (element.css("display") === "none"){
      element.css("display", "block");
      animate(element, "animated fadeInRight");
    } else {
      animate(element, "animated fadeOutRight");
      var wait = setTimeout(function() {
        element.css("display", "none");
      }, 1000);
    }

  });

  function animate(element, classTitle){
		$(element).addClass(classTitle);
		var wait = setTimeout(function() {
			$(element).removeClass(classTitle);
		}, 1000);
  }
  
  $('.addbutton').on('click', function() {
    animate($('.fa-shopping-cart'), "animated flip")  
  });

});