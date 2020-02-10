import 'package:flutter/material.dart';
import '../provider/products_package.dart';
import 'package:provider/provider.dart';
import '../widgets/user_product_items.dart';
import '../widgets/app_drawer.dart';
class UserProductScreen extends StatelessWidget {
  static const USER_PRODUCT_ROUTE="/userproductroute";
  @override
  Widget build(BuildContext context) {
    final products=Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar:AppBar(
        title: Text("My Products"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), onPressed: ()
          {

          }),
        ],
      ),
      body: ListView.builder(
        itemBuilder:(ctx,i)=>
        UserProductItems(
          products.getItems()[i].imageUrl,
          products.getItems()[i].title,
          ),
        itemCount:products.getItems().length , 
      ),
    );
  }
}