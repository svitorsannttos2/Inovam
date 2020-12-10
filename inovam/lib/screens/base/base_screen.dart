import 'package:flutter/material.dart';
import 'package:inovam/common/custom_drawer/custom_drawer.dart';
import 'package:inovam/models/page_manager.dart';
import 'package:inovam/models/user_manager.dart';
import 'package:inovam/screens/admin_users/admin_users_screen.dart';
import 'package:inovam/screens/login/login_screen.dart';
import 'package:inovam/screens/products/products_screen.dart';
import 'package:provider/provider.dart';
import 'package:inovam/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create:(_) => PageManeger(pageController),
      child: Consumer<UserManager>(
        builder: (_,userManage,__){
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget> [
              HomeScreen(),
              ProductsScreen(),
              Scaffold(
                drawer: CustomDrawer(),
                appBar: AppBar(
                  title: const Text('Home 3'),
                ),
              ),
              if(userManage.adminEnabled)
                ...[
                  AdminUsersSreecn(),
                  Scaffold(
                    drawer: CustomDrawer(),
                    appBar: AppBar(
                      title: const Text('Usuários'),
                    ),
                  ),
                  Scaffold(
                    drawer: CustomDrawer(),
                    appBar: AppBar(
                      title: const Text('Pedidos'),
                    ),
                  ),
                ]
            ],
          );
        }
      ),
    );
  }
}
