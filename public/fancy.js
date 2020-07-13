/******/ (function(modules) { // webpackBootstrap
/******/  // The module cache
/******/  var installedModules = {};
/******/
/******/  // The require function
/******/  function __webpack_require__(moduleId) {
/******/
/******/    // Check if module is in cache
/******/    if(installedModules[moduleId]) {
/******/      return installedModules[moduleId].exports;
/******/    }
/******/    // Create a new module (and put it into the cache)
/******/    var module = installedModules[moduleId] = {
/******/      i: moduleId,
/******/      l: false,
/******/      exports: {}
/******/    };
/******/
/******/    // Execute the module function
/******/    modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/    // Flag the module as loaded
/******/    module.l = true;
/******/
/******/    // Return the exports of the module
/******/    return module.exports;
/******/  }
/******/
/******/
/******/  // expose the modules object (__webpack_modules__)
/******/  __webpack_require__.m = modules;
/******/
/******/  // expose the module cache
/******/  __webpack_require__.c = installedModules;
/******/
/******/  // define getter function for harmony exports
/******/  __webpack_require__.d = function(exports, name, getter) {
/******/    if(!__webpack_require__.o(exports, name)) {
/******/      Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/    }
/******/  };
/******/
/******/  // define __esModule on exports
/******/  __webpack_require__.r = function(exports) {
/******/    if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/      Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/    }
/******/    Object.defineProperty(exports, '__esModule', { value: true });
/******/  };
/******/
/******/  // create a fake namespace object
/******/  // mode & 1: value is a module id, require it
/******/  // mode & 2: merge all properties of value into the ns
/******/  // mode & 4: return value when already ns object
/******/  // mode & 8|1: behave like require
/******/  __webpack_require__.t = function(value, mode) {
/******/    if(mode & 1) value = __webpack_require__(value);
/******/    if(mode & 8) return value;
/******/    if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/    var ns = Object.create(null);
/******/    __webpack_require__.r(ns);
/******/    Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/    if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/    return ns;
/******/  };
/******/
/******/  // getDefaultExport function for compatibility with non-harmony modules
/******/  __webpack_require__.n = function(module) {
/******/    var getter = module && module.__esModule ?
/******/      function getDefault() { return module['default']; } :
/******/      function getModuleExports() { return module; };
/******/    __webpack_require__.d(getter, 'a', getter);
/******/    return getter;
/******/  };
/******/
/******/  // Object.prototype.hasOwnProperty.call
/******/  __webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/  // __webpack_public_path__
/******/  __webpack_require__.p = "/packs/";
/******/
/******/
/******/  // Load entry module and return exports
/******/  return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/shopify_client.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/shopify_client.js":
/*!************************************************!*\
  !*** ./app/javascript/packs/shopify_client.js ***!
  \************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! shopify_client */ "./app/javascript/shopify_client/index.js");

/***/ }),

/***/ "./app/javascript/shopify_client/cart_render.js":
/*!******************************************************!*\
  !*** ./app/javascript/shopify_client/cart_render.js ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

StorePickup.CartRender = {
  parent: StorePickup,
  postalCode: function postalCode() {
    var div = document.createElement('div');
    div.setAttribute('class', 'cart-attribute__field postal-code-attr');
    div.innerHTML = "\n        <p class=\"cart-attribute__field\">\n          <label for=\"postal_code\">Enter your postal code to check if you are eligible for local delivery</label>\n          <input id=\"postal_code\" placeholder=\"Your Postal Code\" type=\"text\" name=\"attributes[postal_code]\" value=\"{{ cart.attributes[\"postal_code\"] }}\">\n        </p>\n    ";
    document.getElementById('storepick_cart_portal_code').appendChild(div);
  },
  blockDelivery: function blockDelivery() {
    var showSelect = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
    var loading = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
    var klazz = 'block-delivery-time';
    var div = $('#storepick_cart_portal_code').find("div.".concat(klazz));
    var html = '';
    if (loading) html = 'Loading...';else {
      html = "<div class=\"note\">You are eligible for a local delivery.</div>";
      if (showSelect == false) html += this.deliveryChoose();
      html += this.selectDeliveryTime(showSelect);
    }

    if (div.length == 0) {
      div = document.createElement('div');
      div.setAttribute('class', klazz);
      div.innerHTML = html;
      document.getElementById('storepick_cart_portal_code').appendChild(div);
    } else div.html(html);
  },
  deliveryChoose: function deliveryChoose() {
    console.log('this.parent.Mode', this.parent);
    var html = "\n      <div class=\"delivery-choose\">Your next possible delivery is at ".concat(this.parent.Model.deliveryChoosed, "</div>\n      <button id='choose_other_time' class='btn-choose-other-time'>Choose Another Date/Time</button>\n    ");
    return html;
  },
  selectDeliveryTime: function selectDeliveryTime(showSelect) {
    var deliveryChoosed = this.parent.Model.deliveryChoosed;
    var deliveryTimes = this.parent.Model.deliveryTimes;
    var style = showSelect ? '' : 'display: none';
    var options = '';
    var length = deliveryTimes.length;

    for (var i = 0; i < length; i++) {
      var selected = deliveryTimes[i] == deliveryChoosed ? 'selected' : '';
      options += "<option value=\"".concat(i, "\" ").concat(selected, ">").concat(deliveryTimes[i], "</option>");
    }

    var html = "\n      <div class=\"cart-attribute__field\" style=\"".concat(style, "\">\n        <label>I want my item delivered at</label><br>\n        <select id=\"delivery_time\" name=\"attributes[delivery_time]\">\n          ").concat(options, "\n        </select>\n        <button id='btn_save_delivery' class='btn-save'>Save</button>\n        <button id='btn_cancel_delivery' class='btn-cancel'>Cancel</button>\n      </div>\n    ");
    return html;
  }
};

/***/ }),

/***/ "./app/javascript/shopify_client/index.js":
/*!************************************************!*\
  !*** ./app/javascript/shopify_client/index.js ***!
  \************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! ./init */ "./app/javascript/shopify_client/init.js");

__webpack_require__(/*! ./storepickup */ "./app/javascript/shopify_client/storepickup.js");

__webpack_require__(/*! ./model */ "./app/javascript/shopify_client/model.js");

__webpack_require__(/*! ./cart_render */ "./app/javascript/shopify_client/cart_render.js");

/***/ }),

/***/ "./app/javascript/shopify_client/init.js":
/*!***********************************************!*\
  !*** ./app/javascript/shopify_client/init.js ***!
  \***********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function include(filename, onload) {
  var head = document.getElementsByTagName('head')[0];
  var script = document.createElement('script');
  script.src = filename;
  script.type = 'text/javascript';

  script.onload = script.onreadystatechange = function () {
    if (script.readyState) {
      if (script.readyState === 'complete' || script.readyState === 'loaded') {
        script.onreadystatechange = null;
        onload();
      }
    } else {
      onload();
    }
  };

  head.appendChild(script);
}

include('https://code.jquery.com/jquery-3.5.1.min.js', function () {
  $(document).ready(function () {
    console.log('the DOM is ready');
    StorePickup.init();
  });
});

/***/ }),

/***/ "./app/javascript/shopify_client/model.js":
/*!************************************************!*\
  !*** ./app/javascript/shopify_client/model.js ***!
  \************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

StorePickup.Model = {
  parent: StorePickup,
  domain: 'https://a81125190c56.ngrok.io',
  deliveryChoosed: ''
};

/***/ }),

/***/ "./app/javascript/shopify_client/storepickup.js":
/*!******************************************************!*\
  !*** ./app/javascript/shopify_client/storepickup.js ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

window.StorePickup = {
  CartRender: null,
  Model: null,
  init: function init() {
    var self = this;
    var wrapper = $('#storepick_cart_portal_code');
    wrapper.on('keyup', 'input#postal_code', function (e) {
      if (e.keyCode === 13) {
        self.getDeliveryTime($(this).val());
      }

      e.preventDefault();
      return false;
    });
    wrapper.on('keypress', 'input#postal_code', function (e) {
      if (e.keyCode == 13) {
        e.preventDefault();
        return false;
      }
    });
    wrapper.on('click', 'button#choose_other_time', function (e) {
      self.CartRender.blockDelivery(true);
    });
    wrapper.on('click', 'button#btn_cancel_delivery', function (e) {
      self.CartRender.blockDelivery(false);
    });
    wrapper.on('click', 'button#btn_save_delivery', function (e) {
      self.Model.deliveryChoosed = wrapper.find('select#delivery_time option:selected').text();
      self.CartRender.blockDelivery(false);
    });
  },
  getDeliveryTime: function getDeliveryTime(postalCode) {
    this.CartRender.blockDelivery(false, true);
    var self = this;
    $.post(this.Model.domain + "/v1/shopify/delivery_times", {
      postal_code: postalCode
    }).done(function (resp) {
      console.log('---data---', resp);

      if (resp.error_code == 0) {
        self.Model.deliveryChoosed = resp.data.items[0];
        self.Model.deliveryTimes = resp.data.items;
        self.CartRender.blockDelivery();
      }
    });
  }
};

/***/ })

/******/ });
//# sourceMappingURL=shopify_client-527a9620fc2cf3109594.js.map