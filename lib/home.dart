import 'package:flutter/material.dart';
import 'package:untitled/Homepage.dart';
import 'package:untitled/Profile.dart';

import 'category.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedindex = 0;
  List<Widget> widgetpages = [
    HoomeScreen(),
    Category(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(size: 20, color: Colors.black),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Color.fromARGB(66, 0, 0, 0),
          selectedFontSize: 15,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          currentIndex: selectedindex,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(label: "MyHome", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "MYCategory", icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: "MyAccount", icon: Icon(Icons.person))
          ]),
      body: widgetpages.elementAt(selectedindex),
    );
  }
}
