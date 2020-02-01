import 'package:flutter/material.dart';
import './producTile.dart';
import 'package:provider/provider.dart';
import '../provider/products_package.dart';
class ProductGridVew extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final providerData=Provider.of<Products>(context);
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: providerData.getItems().length,
        itemBuilder:(ctx,i)
        {
          return ChangeNotifierProvider(
            builder: (ctx)=>providerData.getItems()[i],
            child: ProductTile()
            );
        },
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
            );
  }
}