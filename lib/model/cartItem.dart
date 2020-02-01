import 'package:flutter/material.dart';
class cartItem
{
  final String id;
  final String title;
  final double price;
  final int quantity;
  cartItem(
    {
      @required this.id,
      @required this.title,
      @required this.price,
      @required this.quantity,
    });
}