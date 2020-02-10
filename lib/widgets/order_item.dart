import 'package:flutter/material.dart';
import '../model/order.dart';
import 'package:date_format/date_format.dart';
import 'dart:math';
class OrderItems extends StatefulWidget {
final Order order;
OrderItems(this.order);

  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child:Column(
        children: <Widget>[
          ListTile
          (
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              formatDate(widget.order.dateTime,[dd,'/',mm,'/',yyyy,hh,':',mm],
              ),
              ),
            trailing: IconButton(icon: 
            Icon(_isExpanded ? Icons.expand_less : Icons.expand_more), onPressed: ()
            {
              setState(() {
              _isExpanded=!_isExpanded;  
              });
            }), 
          ),
          if(_isExpanded)
          Container(
            padding: EdgeInsets.all(10),
              height: min(widget.order.products.length*20.0+20.0,180.0),
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: 
              (ctx,i)=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${widget.order.products[i].title}',
                    style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                  Text('${widget.order.products[i].quantity}x \$${widget.order.products[i].price}',
                  style:TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold)),
                ],
              ),),
          )
        ],
      ),
   );
  }
}