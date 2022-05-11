import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider_basket_app/constants/color.dart';
import 'package:provider_basket_app/features/basket/basket.dart';
import 'package:provider_basket_app/features/product/products.dart';

import '../../product/model/user_model.dart';
import '../product/model/product_model.dart';


class ShoppTabView extends StatelessWidget {
  const ShoppTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: buildBottomAppBar(context),
          body: TabBarView(
              children:[
                Productss(),
                Basket()
          ]) ,
        )
    );
  }

   BottomAppBar buildBottomAppBar(BuildContext context) {
    return  BottomAppBar(
      color: white,
      child: TabBar(
        labelColor: primary,
          tabs: [
            const Tab(icon: Icon(Icons.home),),
            Tab(
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_basket),
                  Positioned(
                      top: 0,
                      right: 0,
                      height: 0,
                      width: 0,
                      child: buildCircleAvatarCounter(context)



                  )
                ],
              ),
            ),
          ]

      ),
    );
  }
  CircleAvatar buildCircleAvatarCounter(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      child: Text(context.watch<User>().totalProduct.toString(), style: Theme.of(context).textTheme.overline!.copyWith(color: Colors.white)),
    );
  }
}
