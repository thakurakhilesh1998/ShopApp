import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      title:"Shop App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      body: Center(
        child: Text('Let\'s build shop app'),
        )
    );
  }
}