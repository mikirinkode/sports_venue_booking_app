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
  final tabs = [
    HomeScreen(),
    HistoryScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: tabs[_currentIndex],
        bottomNavigationBar: bottomNavComp(),
      ),
    );
  }

  Widget bottomNavComp(){
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: colorWhite,
      unselectedItemColor: colorWhite.withOpacity(0.5),
      showUnselectedLabels: false,
      showSelectedLabels: true,
      backgroundColor: primaryColor,
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
}
