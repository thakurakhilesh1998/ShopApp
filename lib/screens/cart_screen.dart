import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../widgets/cartListView.dart';
import '../provider/order_provider.dart';
class CartScreen extends StatelessWidget {
  static const String cartScreenRoute='/cartScreenRoute';
  @override
  Widget build(BuildContext context) {
final cartProvider=Provider.of<CartProvider>(context);
final orderProvider=Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Total amount",style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,
                ),
                ),
               Chip(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: SizedBox(
                    child: Text('\₹ ${cartProvider.price.toStringAsFixed(1)}',
                    style: TextStyle(color:Colors.white,
                    fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ), 
                  ),
                  FlatButton(onPressed: ()
                  {                    
                  orderProvider.addOrderItem(
                    cartProvider.item.values.toList(),
                    cartProvider.price,
                     );
                  cartProvider.clear();
                  }, child: Text('Place Order',style:TextStyle(fontSize: 20,
                  fontWeight:FontWeight.bold,color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  )
                 ],),
          ),
        SizedBox(
          height:10,
        ),
        Expanded(
            child: ListView.builder(
            itemBuilder:(ctx,index){
          return CardListView(
              productId:cartProvider.items.keys.toList()[index],
              id:cartProvider.items.values.toList()[index].id,
              price:cartProvider.items.values.toList()[index].price,
              quantity:cartProvider.items.values.toList()[index].quantity,
              title:cartProvider.items.values.toList()[index].title,);
            },
            itemCount:cartProvider.items.length,),
        )
        ],
        
      ),
    );
  }
}