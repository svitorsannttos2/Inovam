import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:inovam/models/user.dart';
import 'package:inovam/models/user_manager.dart';

class AdminUserManager extends ChangeNotifier{

  List<User> users =[];
  final Firestore firestore = Firestore.instance;
  StreamSubscription _subscription;

  void updateUser(UserManager userManeger){
    _subscription?.cancel();
    if(userManeger.adminEnabled){
      _listenToUsers();
    } else {
      users.clear();
      notifyListeners();
    }
  }
  void _listenToUsers(){
    _subscription = firestore.collection('users').snapshots().listen((snapshot){
      users = snapshot.documents.map((e) => User.fromDocument(e)).toList();
      users.sort((a,b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      notifyListeners();
    });
  }

  List<String> get names => users.map((e) => e.name).toList();

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}