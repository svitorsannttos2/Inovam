import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:inovam/common/custom_drawer/custom_drawer.dart';
import 'package:inovam/models/admin_users_manager.dart';
import 'package:provider/provider.dart';

class AdminUsersSreecn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Usuários'),
        centerTitle: true,
      ),
      body: Consumer<AdminUserManager>(
        builder: (_, adminUserManager,__){
          return AlphabetListScrollView(
            itemBuilder: (_,index){
              return ListTile(
                title: Text(
                  adminUserManager.users[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black
                  ),
                ),
                subtitle: Text(
                  adminUserManager.users[index].email,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              );
            },
            highlightTextStyle: TextStyle(
              color: Colors.blueAccent,
              fontSize: 20
            ),
            indexedHeight: (index) => 80,
            strList: adminUserManager.names,
            showPreview: true,
          );
        }
      )
    );
  }
}
