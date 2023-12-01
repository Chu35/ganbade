var shoppingCart = (function () {
  var cart = [];

  function Item(name, price, count) {
      this.name = name;
      this.price = price;
      this.count = count;
  }

  function saveCart() {
      sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
  }

  function loadCart() {
      cart = JSON.parse(sessionStorage.getItem('shoppingCart')) || [];
  }

  loadCart();

  var obj = {};

  obj.addItemToCart = function (name, price, count) {
      for (var i in cart) {
          if (cart[i].name === name) {
              cart[i].count++;
              saveCart();
              return;
          }
      }
      var item = new Item(name, price, count);
      cart.push(item);
      saveCart();
  };

  obj.setCountForItem = function (name, count) {
      for (var i in cart) {
          if (cart[i].name === name) {
              cart[i].count = count;
              break;
          }
      }
      saveCart();
  };

  obj.removeItemFromCart = function (name) {
      for (var i in cart) {
          if (cart[i].name === name) {
              cart[i].count--;
              if (cart[i].count === 0) {
                  cart.splice(i, 1);
              }
              break;
          }
      }
      saveCart();
  };

  obj.removeItemFromCartAll = function (name) {
      cart = cart.filter(function (item) {
          return item.name !== name;
      });
      saveCart();
  };

  obj.clearCart = function () {
      cart = [];
      saveCart();
  };

  obj.totalCount = function () {
      return cart.reduce(function (total, item) {
          return total + item.count;
      }, 0);
  };

  obj.totalCart = function () {
      return Math.round(cart.reduce(function (total, item) {
          return total + item.price * item.count;
      }, 0));
  };

  obj.listCart = function () {
      return cart.map(function (item) {
          return {
              name: item.name,
              price: item.price,
              count: item.count,
              total: Math.round(item.price * item.count)
          };
      });
  };

  return obj;
})();

$('.show-cart').on('click', '.delete-item', function (event) {
  var name = $(this).data('name');
  shoppingCart.removeItemFromCartAll(name);
  displayCart();
});

$('.show-cart').on('click', '.minus-item', function (event) {
  var name = $(this).data('name');
  shoppingCart.removeItemFromCart(name);
  displayCart();
});

$('.show-cart').on('click', '.plus-item', function (event) {
  var name = $(this).data('name');
  shoppingCart.addItemToCart(name);
  displayCart();
});

$('.show-cart').on('change', '.item-count', function (event) {
  var name = $(this).data('name');
  var count = Number($(this).val());
  shoppingCart.setCountForItem(name, count);
  displayCart();
});

$('.add-to-cart').click(function (event) {
  event.preventDefault();
  var name = $(this).data('name');
  var price = Number($(this).data('price'));
  shoppingCart.addItemToCart(name, price, 1);
  displayCart();
});

$('.clear-cart').click(function () {
  shoppingCart.clearCart();
  displayCart();
});

function displayCart() {
  var cartArray = shoppingCart.listCart();
  var output = "";
  for (var i in cartArray) {
      output += "<tr>"
          + "<td>" + cartArray[i].name + "</td>"
          + "<td>(" + Math.round(cartArray[i].price) + ")</td>"
          + "<td><div class='input-group'><button class='minus-item input-group-addon btn btn-primary' data-name=" + cartArray[i].name + ">-</button>"
          + "<input type='number' class='item-count form-control' data-name='" + cartArray[i].name + "' value='" + cartArray[i].count + "'>"
          + "<button class='plus-item btn btn-primary input-group-addon' data-name=" + cartArray[i].name + ">+</button></div></td>"
          + "<td><button class='delete-item btn btn-danger' data-name=" + cartArray[i].name + " style='border: none; background: none;'>🗑️</button></td>"
          + " = "
          + "<td>" + Math.round(cartArray[i].total) + "</td>"
          + "</tr>";
  }
  $('.show-cart').html(output);
  $('.total-cart').html(shoppingCart.totalCart());
  $('.total-count').html(shoppingCart.totalCount());
}

displayCart();
