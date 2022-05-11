import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basket_app/constants/color.dart';
import 'package:provider_basket_app/product/widget/card_shape.dart';
import '../../constants/text_style.dart';
import '../../product/model/user_model.dart';
import 'basket_view_model.dart';

class BasketView extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: context.watch<User>().basketItems.length,
                  itemBuilder: (context, index) {
                  final product = context.watch<User>().basketItems[index];
                  num totalSelectedProduct = context.watch<User>().basketProducts[product]!* product.price!;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: white,
                        shape: buildCardShape(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20,),
                            Column(
                              children: [
                                const SizedBox(width: 20,),
                                Image.network(product.image.toString(), width: 100, height: 200,),
                                const SizedBox(width: 20,),
                                Text("${context.watch<User>().basketProducts[product]} * ${product.price}", style: title,),
                                const SizedBox(width: 20,),
                                Text("${totalSelectedProduct.toString()} €", style: title,),
                                const SizedBox(width: 20,),
                              ],
                            ),
                            const SizedBox(width: 20,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Text(product.description.toString(), style: description, textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              ),
          ElevatedButton(
              onPressed:
             context.watch<User>().basketTotalMoney > 100 ? () {} : null,
             child: Text(context.watch<User>().basketTotalMoney > 100 ? "Buy All ${context.watch<User>().basketTotalMoney}€" : "Minimum 100€" ))
        ],
      ),
    );
  }

}