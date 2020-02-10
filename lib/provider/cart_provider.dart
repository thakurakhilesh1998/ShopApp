import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cartItem.dart';
class CartProvider with ChangeNotifier
{
Map<String,cartItem> items={};

Map<String,cartItem> get item{
return {...items};
}
int get quantity{
return items.length;
}
double get price
{
  var total=0.0;

items.forEach((key,cartItem)
{
return total+=cartItem.price * cartItem.quantity; 
});
return total;
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
  notifyListeners();
}
void onRemoveCart(String productId)
{
items.remove(productId);
notifyListeners();
}
void clear()
{
  items={};
notifyListeners();
}
void undoAddToCart(String productId)
{
if(!items.containsKey(productId))
{
  return;
}
if(items[productId].quantity>1)
{
  items.update(productId,(existing)=>cartItem(id: existing.id, 
  title: existing.title, 
  price: existing.price, 
  quantity: existing.quantity-1));
}
else{
items.remove(productId);
}
notifyListeners();
}
}