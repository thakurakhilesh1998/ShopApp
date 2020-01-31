import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductTile extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductTile(this.id,this.title,this.imageUrl);
  @override
  Widget build(BuildContext context) {
    
      return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
          child: GestureDetector(
            onTap: ()
            {
              Navigator.of(context).pushNamed(ProductOverviewscreen.ProductOverviewRoute,arguments: id,);
            },
              child: Image.network(
              imageUrl,fit: BoxFit.cover,
              ),
          ),
            footer:GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(title,textAlign: TextAlign.center,
              ),
              leading: IconButton(icon: Icon(Icons.favorite,
              color:Theme.of(context).accentColor,),
              onPressed: ()
              {},),
              trailing: IconButton(icon: Icon(Icons.shopping_cart,
              color:Theme.of(context).accentColor,),
              onPressed: (){},),
            ),
             
            
        ),

    );
  }
}