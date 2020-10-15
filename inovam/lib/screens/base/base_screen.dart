import 'package:flutter/material.dart';
import 'package:inovam/common/custom_drawer/custom_drawer.dart';
import 'package:inovam/models/page_manager.dart';
import 'package:inovam/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create:(_) => PageManeger(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget> [
          LoginScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home 1'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home 2'),
            ),
          ),
          Container(color: Colors.red,),
          Container(color: Colors.yellow,),
          Container(color: Colors.green,),
        ],
      ),
    );
  }
}
