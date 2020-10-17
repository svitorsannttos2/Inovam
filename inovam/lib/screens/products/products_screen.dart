import 'package:flutter/material.dart';
import 'package:inovam/common/custom_drawer/custom_drawer.dart';
import 'package:inovam/models/product_manager.dart';
import 'package:inovam/screens/products/components/product_list_tile.dart';
import 'package:inovam/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              final search = await showDialog<String>(context: context, builder: (_) => SearchDialog());
              if(search != null){
                context.read<ProductManager>().search = search;
              }
            },
          )
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __){
          final filteredProducts = productManager.filteredProducts;
          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: filteredProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(filteredProducts[index]);
            }
          );
        }
      ),
    );
  }
}
