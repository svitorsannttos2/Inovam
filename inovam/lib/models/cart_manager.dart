import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inovam/models/cart_product.dart';
import 'package:inovam/models/product.dart';
import 'package:inovam/models/user.dart';
import 'package:inovam/models/user_manager.dart';

class CartManager {

  List<CartProduct> items = [];

  User user;

  void updateUser(UserManager userManager){
    user = userManager.user;
    items.clear();

    if(user != null ){
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async{
    final QuerySnapshot cartSnap = await user.cartReference.getDocuments();

    items = cartSnap.documents.map((d) => CartProduct.fromDocument(d)).toList();
  }

  void addToCart(Product product){
    try{
      final e = items.firstWhere((p) => p.stackable(product));
      e.quantity++;
    }catch (e){
      final cartProduct = CartProduct.fromProduct(product);
      items.add(cartProduct);
      user.cartReference.add(cartProduct.toCartItemMap());
    }
  }

}