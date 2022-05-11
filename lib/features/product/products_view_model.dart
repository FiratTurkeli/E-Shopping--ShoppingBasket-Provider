import 'package:provider_basket_app/product/service/user_service.dart';

import 'products.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'model/product_model.dart';

abstract class ProductsViewModel extends State<Productss> {

  List products = <Products>[];


  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

 void  getAllProducts() async {
    products = await context.read<UserService>().getAllProducts();
    setState(() {

    });
  }


}