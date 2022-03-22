import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spod_app/theme.dart';

import 'screen/about_screen.dart';
import 'screen/transaction_history_screen.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: createMaterialColor(primaryColor500),
          canvasColor: colorWhite),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final screens = [
    HomeScreen(),
    TransactionHistoryScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: lightBlue100,
            statusBarIconBrightness: Brightness.dark),
      ),
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
        label: const ["Home", "Transactions", "About"],
        onChange: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
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
      _navBarItems.add(bottomNavBarItem(
          _selectedItemIcon[i], _unselectedItemIcon[i], _label[i], i));
    }
    return Container(
      decoration: const BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
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
        width: MediaQuery.of(context).size.width / _selectedItemIcon.length,
        child: _selectedIndex == index
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        activeIcon,
                        width: 26,
                        height: 26,
                        color: primaryColor500,
                      ),
                    ),
                    Text(
                      label,
                      style: bottomNavTextStyle,
                    )
                  ],
                ),
              )
            : Image.asset(
                inactiveIcon,
                width: 26,
                height: 26,
                color: primaryColor300,
              ),
      ),
    );
  }
}
