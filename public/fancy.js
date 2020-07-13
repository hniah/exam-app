console.log('----------------FancyJS-----------------');
function include(filename, onload) {
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.src = filename;
    script.type = 'text/javascript';
    script.onload = script.onreadystatechange = function() {
        if (script.readyState) {
            if (script.readyState === 'complete' || script.readyState === 'loaded') {
                script.onreadystatechange = null;                                                  
                onload();
            }
        } 
        else {
            onload();          
        }
    };
    head.appendChild(script);
}

include('https://code.jquery.com/jquery-3.5.1.min.js', function() {
  $(document).ready(function() {
    console.log('the DOM is ready');
    StorePickup.init();
  });
});

var StorePickup = {
  init: function(){
    $.post( "https://a81125190c56.ngrok.io/v1/shopify/delivery_times?shop=anthony-development-store.myshopify.com", { postal_code: "Testing",})
      .done(function( data ) {
        console.log('---data---', data);
      });
  }
}

// StorePickup.init();