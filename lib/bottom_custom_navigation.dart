import 'package:flutter/material.dart';
import 'package:wtf_flutter_projects/pages/contact_page.dart';
import 'package:wtf_flutter_projects/pages/home_page.dart';
import 'package:wtf_flutter_projects/pages/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexToBeShown = 0;
  
  var pages = [HomePage(), ContactPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexToBeShown,
        onTap: (value) {
          setState(() {
            indexToBeShown =value;
          });
        },


        items: [
          BottomNavigationBarItem(label: "Home",icon:  Icon(Icons.home)),
          BottomNavigationBarItem(label: "Contact",icon:   Icon(Icons.call)),
          BottomNavigationBarItem(label: "Profile", icon:  Icon(Icons.person)),
        ],
      ),
    );
  }
}
