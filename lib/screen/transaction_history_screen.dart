import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBlue100,
        body: noTransaction(context));
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
                onPressed: () {},
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
