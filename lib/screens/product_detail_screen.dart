import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products_package.dart';
class ProductOverviewscreen extends StatelessWidget {
  static const ProductOverviewRoute='/ProductOverviewRoute';
  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context).settings.arguments as String;
       final loadedData=Provider.of<Products>(context,listen: false).getProductId(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedData.title),
      ),
    );
  }
}