import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_basket_app/features/product/model/product_model.dart';

import '../service/user_service.dart';

class User extends ChangeNotifier{

  Map<Products, int> basketProducts = {};

  List<Products> get basketItems => basketProducts.keys.toList();


  late UserService service;

  User(BuildContext context){
    service = context.read<UserService>();
  }
  
  double get basketTotalMoney {
    if (basketProducts.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      basketProducts.forEach((key, value) {
        _total += key.price!.toInt() * value;
      });
      return _total;
    }
  }

  int get totalProduct{
    return basketProducts.length;
  }


  void addFirstItemToBasket(Products product) {
    basketProducts[product] = 1;
    service.addProduct(product);
    notifyListeners();
  }

  void incrementProduct(Products product) {
    if (basketProducts[product] == null) {
      addFirstItemToBasket(product);
      return;
    } else {
      basketProducts[product] = basketProducts[product]! +1;
      notifyListeners();
    }
  }

  void increseProduct(Products product) {

    if (basketProducts[product] == null) return;
    if (basketProducts[product] == 0) {
      basketProducts.removeWhere((key, value) => key == product);
    } else {
        basketProducts[product] = basketProducts[product]!-1;
    }
    notifyListeners();
  }




}