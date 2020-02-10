import 'package:flutter/material.dart';
import './cartItem.dart';

class Order
{
 final String id;
 final double amount;
 final List<cartItem> products;
  DateTime dateTime;

Order({
  @required this.id,@required this.amount,@required this.products ,@required this.dateTime,
});
}