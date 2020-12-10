import 'package:flutter/material.dart';
import 'package:inovam/models/admin_users_manager.dart';
import 'package:inovam/models/cart_manager.dart';
import 'package:inovam/models/home_manager.dart';
import 'package:inovam/models/product_manager.dart';
import 'package:inovam/models/user_manager.dart';
import 'package:inovam/screens/base/base_screen.dart';
import 'package:inovam/screens/cart/cart_screen.dart';
import 'package:inovam/screens/edit_product/edit-product-screen.dart';
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
        ChangeNotifierProvider(
          create: (_) => HomeManager() ,
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager,CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_,userManager,cartManager) =>
          cartManager..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUserManager>(
         create: (_) => AdminUserManager(),
         lazy: false,
          update: (_, userManager, adminUserManager) =>
              adminUserManager..updateUser(userManager)
        )
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
            case '/edit_product':
              return MaterialPageRoute(
                  builder: (_) => EditProductScreen()
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
