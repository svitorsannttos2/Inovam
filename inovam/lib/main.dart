import 'package:flutter/material.dart';
import 'package:inovam/models/cart_manager.dart';
import 'package:inovam/models/product_manager.dart';
import 'package:inovam/models/user_manager.dart';
import 'package:inovam/screens/base/base_screen.dart';
import 'package:inovam/screens/cart/cart_screen.dart';
import 'package:inovam/screens/login/login_screen.dart';
import 'package:inovam/screens/product/product_screen.dart';
import 'package:inovam/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';

import 'models/product.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager,CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_,userManager,cartManager) =>
          cartManager..updateUser(userManager),
        ),
      ],
      child: MaterialApp(
        title: 'Inovam',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                builder: (_) => LoginScreen()
              );
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignUpScreen()
              );
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(
                    settings.arguments as Product
                  )
              );
            case '/cart':
              return MaterialPageRoute(
                  builder: (_) => CartScreen()
              );
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen()
              );
          }
        },
      ),
    );
  }
}
