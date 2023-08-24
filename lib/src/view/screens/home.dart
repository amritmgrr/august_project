// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   String title;
//   secondScreen({super.key,required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text(title),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  String title;
   HomeScreen({super.key,required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  

}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          print("Current value:$value");
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.layers), label:"home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),label:"cart"),
      ]),
    );
  }
}