import 'package:flutter/material.dart';
import 'package:spod_app/theme.dart';

import 'screen/about_screen.dart';
import 'screen/transaction_history_screen.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(SpodApp());
}

class SpodApp extends StatefulWidget {
  @override
  State<SpodApp> createState() => _SpodAppState();
}

class _SpodAppState extends State<SpodApp> {
  int _currentIndex = 0;
  final screens = [
    HomeScreen(),
    TransactionHistoryScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(primaryColor),
        canvasColor: colorWhite
      ),
      home: Scaffold(
        backgroundColor: lightBlue100,
        body: screens[_currentIndex],
        bottomNavigationBar: CustomBottomNavBar(
          selectedItemIcon: const [
            "assets/icons/home_fill.png",
            "assets/icons/receipt_fill.png",
            "assets/icons/about_fill.png"
          ],
          unselectedItemIcon: const [
            "assets/icons/home_outlined.png",
            "assets/icons/receipt_outlined.png",
            "assets/icons/about_outlined.png"
          ],
          label: const[
            "Home",
            "Transactions",
            "About"
          ],
          onChange: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final List<String> selectedItemIcon;
  final List<String> unselectedItemIcon;
  final List<String> label;
  final Function(int) onChange;

  const CustomBottomNavBar(
      {this.defaultSelectedIndex = 0,
      required this.selectedItemIcon,
      required this.unselectedItemIcon,
      required this.label,
      required this.onChange});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  List<String> _selectedItemIcon = [];
  List<String> _unselectedItemIcon = [];
  List<String> _label = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _selectedItemIcon = widget.selectedItemIcon;
    _unselectedItemIcon = widget.unselectedItemIcon;
    _label = widget.label;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItems = [];

    for (int i = 0; i < 3; i++) {
      _navBarItems.add(
          bottomNavBarItem(_selectedItemIcon[i], _unselectedItemIcon[i], _label[i], i));
    }
    return Container(
      decoration: const BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _navBarItems,
      ),
    );
  }

  Widget bottomNavBarItem(activeIcon, inactiveIcon, label, index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: _selectedIndex == index
            ? Image.asset(
              activeIcon,
              width: 26,
              height: 26,
              color: primaryColor,
            )
            : Image.asset(
                inactiveIcon,
                width: 26,
                height: 26,
                color: lightBlue400,
              ),
      ),
    );
  }
}
