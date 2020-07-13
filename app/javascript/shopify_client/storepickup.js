window.StorePickup = {
  CartRender: null,
  Model: null,
  init: function(){
    let self = this;
    const wrapper = jQuery('#storepick_cart_portal_code');
    wrapper.on('keyup', 'input#postal_code', function (e) {
      if (e.keyCode === 13) {
        self.getDeliveryTime($(this).val())
      }
      e.preventDefault();
      return false;
    });

    wrapper.on('keypress', 'input#postal_code', function(e) {
      if(e.keyCode == 13) {
        e.preventDefault();
        return false;
      }
    });
    wrapper.on('click','button#choose_other_time', function(e) { 
      self.CartRender.blockDelivery(true);
    });
    wrapper.on('click','button#btn_cancel_delivery', function(e) { 
      self.CartRender.blockDelivery(false);
    });
    wrapper.on('click','button#btn_save_delivery', function(e) {
      self.Model.deliveryChoosed = wrapper.find('select#delivery_time option:selected').text();
      self.CartRender.blockDelivery(false);
    });
  },
  getDeliveryTime: function(postalCode){
    this.CartRender.blockDelivery(false, true);
    let self = this;
    jQuery.post( this.Model.domain+"/v1/shopify/delivery_times", { postal_code: postalCode})
    .done(function( resp ) {
      console.log('---data---', resp);
      if (resp.error_code == 0){
        self.Model.deliveryChoosed = resp.data.items[0];
        self.Model.deliveryTimes = resp.data.items
        self.CartRender.blockDelivery();
      }
    });
  }
}