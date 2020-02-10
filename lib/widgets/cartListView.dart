import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
class CardListView extends StatelessWidget {
  final String productId;
  final String id;
  final String title;
  final int quantity;
  final double price;
  CardListView({
    @required this.productId,
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
  @override
  Widget build(BuildContext context) {
    final cartProvider=Provider.of<CartProvider>(context,listen: false);
    return Dismissible(
    
          key: ValueKey(id),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction){
            return showDialog(
              context: context,
              builder: (ctx)=>AlertDialog(
                title: Text("Are You Sure?"),
                content: Text("Are you want to remove the item from cart"),
                actions: <Widget>[
                  FlatButton(onPressed: ()
                  {
                    Navigator.of(ctx).pop(true);
                  },
                   child: Text('Yes')),
                   FlatButton(onPressed: (){
                    Navigator.of(ctx).pop(false);
                   },
                    child: Text('No'),
                   ),
                ],
              )
            );
          } ,   
          background: Container(
            padding: EdgeInsets.only(right: 20),
            color:Theme.of(context).primaryColor,
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5
              ),
              child: Icon(Icons.delete,
              color: Colors.white,size: 40,),
              alignment: Alignment.centerRight,
          ),
          onDismissed: (direction)
          {
              return cartProvider.onRemoveCart(productId);
          },
          child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
            leading:CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('\₹ $price',
                style: TextStyle(fontSize: 30,
                fontWeight:FontWeight.bold),),
                ),),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            title: Text(title),
            subtitle: Text('\₹ ${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
       )

      ),
    );
  }
}