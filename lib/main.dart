import 'package:flutter/material.dart';
import 'package:shopapp/provider/cart_provider.dart';
import 'package:shopapp/screens/projectOverView.dart';
import './screens/product_detail_screen.dart';
import './provider/products_package.dart';
import 'package:provider/provider.dart';
import './screens/cart_screen.dart';
import './provider/order_provider.dart';
import './screens/order_screen.dart';
import './screens/user_product_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OrderProvider(),
          )
      ],
        child: MaterialApp(
        title:"Shop App",
        theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
        ),
        home: ProjectOverView(),
        routes: {
                ProductOverviewscreen.ProductOverviewRoute:(ctx)=>ProductOverviewscreen(),
                CartScreen.cartScreenRoute:(ctx) => CartScreen(),
                OrderScreen.OrderScreenRoute:(ctx)=>OrderScreen(),
                UserProductScreen.USER_PRODUCT_ROUTE:(ctx)=>UserProductScreen(),
                },
    ));
  }
}
