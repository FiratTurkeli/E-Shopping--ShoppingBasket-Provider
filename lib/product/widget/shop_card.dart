import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider_basket_app/constants/color.dart';
import 'package:provider_basket_app/constants/text_style.dart';
import 'package:provider_basket_app/features/product/model/product_model.dart';
import 'package:provider/provider.dart';
import 'package:provider_basket_app/product/widget/card_shape.dart';

import '../model/user_model.dart';

class ShopCard extends StatelessWidget {
  Products product;
   ShopCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: white,
      shape: buildCardShape(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            productCategory(),
            buildBox(context),
            buildWrapSub()
          ],
        )
    );
  }



  SizedBox buildBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(child: buildSizedBoxImage(context)),
          ),
          buildIconButtonAdd(context),
        ],
      ),
    );
  }

  Text productCategory(){
    return Text(product.category.toString(), style: category,);
  }


  IconButton buildIconButtonAdd(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shopping_basket, color: primary,),
      onPressed: () {
        context.read<User>().addFirstItemToBasket(product);
      },
    );
  }

  Widget buildSizedBoxImage(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.3, child: Image.network(product.image.toString()),),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildContainerItem(context),
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.1, child:  Text("${product.price}€", style: price,),),
      ],
    );
  }

  Container buildContainerItem(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildIconButtonIncrement(context),
          Text("${context.watch<User>().basketProducts[product] ?? 0}"),
          buildIconButtonRemove(context),
        ],
      ),
    );
  }

  IconButton buildIconButtonIncrement(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        context.read<User>().incrementProduct(product);
      },
    );
  }

  IconButton buildIconButtonRemove(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: () {
        context.read<User>().increseProduct(product);
      },
    );
  }

  Wrap buildWrapSub() {
    return Wrap(
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.spaceAround,
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(product.title.toString(), style: title,textAlign: TextAlign.center,),
              const SizedBox(height: 25),
              Text(product.description.toString(), style: description,textAlign: TextAlign.center,),
            ],
          ),
        ),
      ],
    );
  }
}
