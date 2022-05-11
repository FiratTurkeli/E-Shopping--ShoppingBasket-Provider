import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_basket_app/constants/color.dart';
import 'package:provider_basket_app/constants/text_style.dart';
import 'package:provider_basket_app/product/widget/shop_card.dart';
import 'package:provider/provider.dart';
import '../../product/model/user_model.dart';
import 'products_view_model.dart';

class ProductsView extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("E-Shop", style: appTitle,),
      actions: [
        buildActionChipTotalMoney()
      ],
      ),
      body: ListView.builder(
        itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1/2,
                child: ShopCard(
                    product: products[index]

                )
              ),
            );
          })
      );
  }

  ActionChip buildActionChipTotalMoney(){
    return ActionChip(
      backgroundColor: white,
        label: Text("${context.watch<User>().basketTotalMoney}"),
        onPressed: (){

        }
    );
  }
}