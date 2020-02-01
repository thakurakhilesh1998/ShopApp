import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';
class ProductTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productInfo=Provider.of<Product>(context,listen: false);
      return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
          child: GestureDetector(
            onTap: ()
            {
              Navigator.of(context).pushNamed(ProductOverviewscreen.ProductOverviewRoute,arguments: productInfo.id,);
            },
              child: Image.network(
              productInfo.imageUrl,fit: BoxFit.cover,
              ),
          ),
            footer:GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(productInfo.title,textAlign: TextAlign.center,
              ),
              leading: Consumer<Product>(
                builder: (context,product,child)=>IconButton(icon: Icon(
                productInfo.isFavourite ? Icons.favorite : Icons.favorite_border,
                color:Theme.of(context).accentColor,),
                onPressed:()
                {
                  productInfo.toggleFavourite();
                },),
              ),
              trailing: IconButton(icon: Icon(Icons.shopping_cart,
              color:Theme.of(context).accentColor,),
              onPressed: (){},),
            ),
        ),

    );
  }
}