import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/widgets/badge.dart';
import 'package:shopapp/widgets/product_grid_view.dart';
import '../provider/cart_provider.dart';
enum SelectedValue
{
  Favourite,
  All,
}
class ProjectOverView extends StatefulWidget {
  @override
  _ProjectOverViewState createState() => _ProjectOverViewState();
}

class _ProjectOverViewState extends State<ProjectOverView> {
  var selectedValue=false;

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        actions: <Widget>[

          Consumer<CartProvider>(
            builder: (context,cartProvider,childs) =>Badge(
               child: childs,
                value:'${cartProvider.quantity}',
            ),
            child: IconButton(icon: Icon(
                Icons.shopping_cart),
                onPressed: (){},),
          ),
          PopupMenuButton(
            onSelected: (SelectedValue value)
            {
              setState(() {
              if(value==SelectedValue.Favourite)
              {
                selectedValue=true;
              }
              else
              {
                selectedValue=false;
              }   
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_)=>[
              PopupMenuItem(child: Text('Show Favourite'),value: SelectedValue.Favourite,),
              PopupMenuItem(child: Text('Show All'),value: SelectedValue.All,)
            ],
         ),
        ],
        title: Text("MyShop"),
      ),
      body: ProductGridVew(selectedValue),
          );
        }
}