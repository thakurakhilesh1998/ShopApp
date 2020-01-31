import 'package:flutter/material.dart';
class ProductOverviewscreen extends StatelessWidget {
  static const ProductOverviewRoute='/productoverviewroute';
  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductOverviewScreen"),
      ),
    );
  }
}