import 'package:flutter/material.dart';
import 'package:shopapp/widgets/product_grid_view.dart';
class ProjectOverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      body: ProductGridVew(),
          );
        }
      }