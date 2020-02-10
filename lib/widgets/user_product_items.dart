import 'package:flutter/material.dart';
class UserProductItems extends StatelessWidget {
  final String title;
  final String imageUrl;
  UserProductItems(this.imageUrl,this.title);
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
                  onPressed: (){}),
                IconButton(
                  icon: Icon(Icons.delete,
                  color: Theme.of(context).errorColor,
                  ), onPressed: (){})  
              ],
            ),
          ),
          )
      ),
    );
  }
}