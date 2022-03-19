import 'package:flutter/material.dart';
import 'package:spod_app/theme.dart';

import 'screen/about_screen.dart';
import 'screen/history_screen.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final screens = [
    HomeScreen(),
    HistoryScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(primaryColor),
      ),
      home: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: bottomNavComp(),
      ),
    );
  }

  Widget bottomNavComp(){
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: lightBlue400,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (value){
        setState(() {
          _currentIndex = value;
        });
      },

      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History"),
        BottomNavigationBarItem(
            icon: Icon(Icons.workspaces_filled),
            label: "About"),
      ],
    );
  }

  Widget bottomNavBarItem(){
    return Container(

    );
  }
}
