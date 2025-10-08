import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
    title: Text("Medicall"),
    centerTitle: true,
    leading: Icon(Icons.menu),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Icon(Icons.search),
      ),
    ],
    ), 
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search Hospital or Address",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16), 
              ),
            ),
          ),
          
          ),
          
        ],

    ),
    );
    
  }
}
