import 'package:flutter/material.dart';
import '../widgets/order_item.dart';
import 'package:provider/provider.dart';
import '../provider/order_provider.dart';
import '../widgets/app_drawer.dart';
class OrderScreen extends StatelessWidget {
  static const OrderScreenRoute='/orderSCreenRoute';
  @override
  Widget build(BuildContext context) {
    final orders =Provider.of<OrderProvider>(context);
    return Scaffold(
     drawer: AppDrawer(),
      appBar: AppBar(
      title: Text("Order Screen"),
      ),
      body: ListView.builder(
        itemCount: orders.items.length,
        itemBuilder: (ctx,i)=>OrderItems(orders.items[i]), 
      )
    );

  }
}