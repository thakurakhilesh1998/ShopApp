import '../model/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier
{
  List<Product> items=[
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p5',
      title: 'HeadPhone',
      description: 'Music can not be this way',
      price: 19.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),

    Product(
      id: 'p4',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://lh3.googleusercontent.com/proxy/haFGDg0kI3N8IUYlgg1PtDE-CwYubAW5Jhe46iwsupZ4VNC7aUupiJ4mmsOpNYmSNWQ5f4-1E8N_woQokVSTgDFEySnxkdQ',
    ),

  ];
  List<Product> getItems()
  {
    return [...items];
  }
  List<Product> get favourite
  {
     return items.where((prodItem) => prodItem.isFavourite).toList();
  
  }
  Product getProductId(String id)
  {
   return (items.firstWhere((meal)
    {
     return( 
       meal.id==id
       );
    })
   );
  }
  void addItem(Product productData)
  {
    final product=Product(
      id: DateTime.now().toString(),
      title: productData.title,
      description: productData.description,
      imageUrl: productData.imageUrl,
      price: productData.price);
    items.add(product);
    notifyListeners();
  }
  void updateProduct(String productId,Product newProduct)
  {
    final index=items.indexWhere((result)=>result.id==productId);
    if(index>=0)
    {
      items[index]=newProduct;
      notifyListeners();
    }
    else
    {
      //do nothing
    }
  }
  void onDeleteProduct(String id)
  {
    items.removeWhere((result)=>result.id==id);
    notifyListeners();
  }

}