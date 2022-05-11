import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_basket_app/features/product/model/product_model.dart';

class UserService {
    var url = "https://fakestoreapi.com/products";



    Future<List<Products>> getAllProducts() async {
      final response = await Dio().get(url,);

      if (response.statusCode == 200) {
         print(response.statusCode);
         print(response.data);
         final responseBody = response.data as List;
         return responseBody.map((e) => Products.fromJson(e)).toList();
        }

      throw Exception();
    }

    Future<bool> addProduct(Products product) async {
      final response = await Dio().post(url, data: product.toJson(),);

      if (response.statusCode == 200 ) {
        return true;
      }

      return false;
    }
}

