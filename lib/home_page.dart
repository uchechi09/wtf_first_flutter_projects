import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
    title: Text("MediCall"),
    centerTitle: true,
    leading: Icon(Icons.menu),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Icon(Icons.search),
      ),
    ],
    ), 
    body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4,),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintText: "Search Hospital or Address",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12), 
              ),
            ),
          ),
          
          ),
          // widget for showing image
          Image.asset("assets/map.jpg"),
          

      ],
    
    ),
    );
     
  }
}
