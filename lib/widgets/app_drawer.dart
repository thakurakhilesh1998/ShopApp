import 'package:flutter/material.dart';
import 'package:shopapp/screens/user_product_screen.dart';
import '../screens/order_screen.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title:Text("Order App Drawer"),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading:Icon(Icons.shop,),
          onTap:()=> Navigator.of(context).pushNamed('/'),
          title: Text("Shop")
          ),
        Divider(),
        ListTile(
          leading:Icon(Icons.payment,),
          onTap:()=> Navigator.of(context).pushNamed(OrderScreen.OrderScreenRoute),
          title: Text("My Orders")
          ),
        Divider(),
        ListTile(
          leading:Icon(Icons.edit,),
          onTap:()=> Navigator.of(context).pushNamed(UserProductScreen.USER_PRODUCT_ROUTE),
          title: Text("My Products")
          ),
        
      ],
  ),
    );
  }
}