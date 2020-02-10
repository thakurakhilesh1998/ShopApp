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
      body: Column(
        children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
              style:BorderStyle.solid),
              borderRadius: BorderRadius.circular(6),
          ),
          height:250,
          width: double.infinity,
         child: Image.network(loadedData.imageUrl,
         fit: BoxFit.cover,
         colorBlendMode: BlendMode.plus,),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Price ₹ ${loadedData.price}',
        style: TextStyle(fontSize:20,
        fontWeight:FontWeight.bold,
        color: Colors.black),),
        SizedBox(
          height:10,
        ),
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Text(
            loadedData.description,
            softWrap: true,
            style: TextStyle(fontSize:20,
            color:Colors.red),
          ),
        ),
      ],),
    );
  }
}