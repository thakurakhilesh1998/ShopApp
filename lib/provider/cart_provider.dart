import 'dart:collection';

import 'package:flutter/material.dart';
import '../model/cartItem.dart';
class CartProvider with ChangeNotifier
{
Map<String,cartItem> items;

Map<String,cartItem> get item{
return {...items};
}
void addCartItem(String productId,String title,double price )
{
  if(items.containsKey(productId))
  {
  items.update(productId,(existing)=>cartItem(
  id:existing.id,
  price: existing.price,
  title: existing.title,
  quantity:existing.quantity+1));
  }
  else
  {
    items.putIfAbsent(productId, ()=>cartItem(
      id: DateTime.now().toString(),
      title: title,
      price: price,
      quantity: 1),
      );
  }
}

}