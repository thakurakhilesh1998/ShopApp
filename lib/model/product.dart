import 'package:flutter/foundation.dart';

class Product
{
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageURL;
  bool isFavourite;
  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.imageURL,
    this.isFavourite=false,
  });
}