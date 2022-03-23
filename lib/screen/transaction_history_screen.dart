import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spod_app/screen/search_screen.dart';

import '../theme.dart';

class TransactionHistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          backgroundColor: lightBlue100,
          appBar: AppBar(
            toolbarHeight: kTextTabBarHeight,
            title: Text(
              "Transaction",
              style: titleTextStyle,
            ),
            backgroundColor: lightBlue100,
            elevation: 0.0,
            centerTitle: true,
            bottom: TabBar(
              labelStyle: tabBarTextStyle,
              labelColor: primaryColor500,
              unselectedLabelColor: darkBlue300,
              indicatorColor: primaryColor500,
              tabs: [
                Tab(
                  text: "Order",
                ),
                Tab(
                  text: "History",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget noTransaction(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/no_transaction_illustration.png",
              width: 150,
            ),
            Text(
              "No Transactions, yet.",
              style: titleTextStyle.copyWith(color: darkBlue300),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              "You have never placed an order. Let's explore the field near you.",
              style: descTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32.0,
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchScreen();
                  }));
                },
                icon: Icon(Icons.search),
                label: Text(
                  "Search a Field",
                  style: buttonTextStyle.copyWith(color: primaryColor500),
                ))
          ],
        ),
      ),
    );
  }
}
