StorePickup.CartRender = {
  parent: StorePickup,
  postalCode: function(){
    let html = `
      <p class="cart-attribute__field postal-code-attr">
        <label for="postal_code">Enter your postal code to check if you are eligible for local delivery</label>
        <input id="postal_code" placeholder="Your Postal Code" type="text" name="attributes[postal_code]" value="{{ cart.attributes["postal_code"] }}">
      </p>
    `;
    jQuery('#storepick_cart_portal_code').html(html);
  },
  blockDelivery: function(showSelect = false, loading=false) {
    let klazz ='block-delivery-time';
    let div = jQuery('#storepick_cart_portal_code').find(`div.${klazz}`);
    let html = '';

    if(loading)
      html = 'Loading...';
    else
    {
      html = `<div class="info">You are eligible for a local delivery.</div>`;

      if (showSelect == false)
        html += this.deliveryChoose();
      html += this.selectDeliveryTime(showSelect);
    }

    if (div.length == 0){
      div = document.createElement('div');
      div.setAttribute('class', klazz);
      div.innerHTML = html
      document.getElementById('storepick_cart_portal_code').appendChild(div);
    }
    else
      div.html(html)
  },
  deliveryChoose: function(){
    console.log('this.parent.Mode', this.parent);
    let html =`
      <div class="delivery-choose">Your next possible delivery is at ${this.parent.Model.deliveryChoosed}</div>
      <button id='choose_other_time' class='btn-choose-other-time'>Choose Another Date/Time</button>
    `
    return html;
  },
  selectDeliveryTime: function(showSelect){
    const deliveryChoosed = this.parent.Model.deliveryChoosed;
    const deliveryTimes = this.parent.Model.deliveryTimes;

    let style = showSelect ? '' : 'display: none';
    let options = '';
    let length = deliveryTimes.length;
    for(let i = 0; i < length; i++){
      let selected = (deliveryTimes[i] == deliveryChoosed) ? 'selected' : '';
      options += `<option value="${i}" ${selected}>${deliveryTimes[i]}</option>`;
    }

    let html = `
      <div class="cart-attribute__field" style="${style}">
        <label>I want my item delivered at</label><br>
        <select id="delivery_time" name="attributes[delivery_time]">
          ${options}
        </select>
        <button id='btn_save_delivery' class='btn-save'>Save</button>
        <button id='btn_cancel_delivery' class='btn-cancel'>Cancel</button>
      </div>
    `
    return html;
  }
}