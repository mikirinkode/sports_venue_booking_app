import 'package:flutter/material.dart';

import '../screen/search_screen.dart';
import '../theme.dart';

class NoTranscationMessage extends StatelessWidget {
  const NoTranscationMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      return SearchScreen(selectedDropdownItem: "",);
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
