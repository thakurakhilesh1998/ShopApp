import 'package:flutter/material.dart';
import '../model/order.dart';
import '../model/cartItem.dart';
class OrderProvider with ChangeNotifier
{
List<Order> orderItems=[];

List<Order> get items
{
  return [...orderItems];
}
void addOrderItem(List<cartItem> products,double amount)
{
orderItems.insert(0,
 Order(
  amount: amount,
  products: products,
  dateTime: DateTime.now(),
  id: DateTime.now().toString()
));
notifyListeners();
}
}