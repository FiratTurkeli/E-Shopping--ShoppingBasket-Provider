import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basket_app/constants/color.dart';
import 'package:provider_basket_app/features/tabs/shoppi_tab_view.dart';
import 'package:provider_basket_app/product/model/user_model.dart';
import 'package:provider_basket_app/product/service/user_service.dart';

void main() {
  runApp(
      MultiProvider(
          providers:[
            Provider<UserService>(create: (context) => UserService()),
            ChangeNotifierProvider(create: (context) => User(context))],
          child: MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Shop App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ShoppTabView(),
    );
  }
}

