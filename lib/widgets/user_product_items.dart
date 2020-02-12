import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_add.dart';
import '../provider/products_package.dart';
class UserProductItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserProductItems(this.id,this.imageUrl,this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:4,horizontal: 8),
      child: Card(
        elevation: 2,
        child:ListTile(
          title:Text(title),
          leading: CircleAvatar(
            backgroundImage:NetworkImage(imageUrl),
          ),
          trailing: Container(
            width: 100,
                    child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit,
                  color: Theme.of(context).primaryColor,
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(EditAdd.EditAddRoute,arguments: id);
                  }),
                IconButton(
                  icon: Icon(Icons.delete,
                  color: Theme.of(context).errorColor,
                  ), onPressed: (){
                    Provider.of<Products>(context).onDeleteProduct(id);
                  })  
              ],
            ),
          ),
          )
      ),
    );
  }
}