import 'package:flutter/material.dart';
import 'package:inovam/models/user_manager.dart';
import 'package:inovam/screens/base/base_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: 'Inovam',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: BaseScreen(),
      ),
    );
  }
}
