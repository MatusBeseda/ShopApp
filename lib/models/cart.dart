import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Vysoka kozena obuv',
        price: '80',
        description: 'Stylova obuv',
        imagePath: 'lib/images/1.jpg'),
    Shoe(
        name: 'Cierna nizka obuv',
        price: '50',
        description: 'Elegantna obuv',
        imagePath: 'lib/images/2.jpg'),
    Shoe(
        name: 'Cierna vysoka obuv',
        price: '90',
        description: 'Stylova obuv',
        imagePath: 'lib/images/3.jpg'),
    Shoe(
        name: 'Obuv k obleku',
        price: '100',
        description: 'Formalna obuv',
        imagePath: 'lib/images/4.jpg'),
    Shoe(
        name: 'Vysoka bezna obuv',
        price: '40',
        description: 'Bezna obuv',
        imagePath: 'lib/images/5.jpg'),
  ];
  //list of item in user cart
  List<Shoe> userCart = [];
  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getCart() {
    return userCart;
  }

  //add items to cart
  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart
  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
