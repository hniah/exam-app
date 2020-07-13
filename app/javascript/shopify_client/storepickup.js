window.StorePickup = {
  model: {
    domain: 'https://a81125190c56.ngrok.io'
  },
  init: function(){
   
  },
  getDeliveryTime: function(postalCode){
   $.post( this.model.domain+"/v1/shopify/delivery_times", { postal_code: postalCode})
    .done(function( data ) {
      console.log('---data---', data);
    });
  }
}