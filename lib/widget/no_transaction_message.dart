import 'package:flutter/material.dart';

import '../screen/search_screen.dart';
import '../theme.dart';

class NoTranscationMessage extends StatelessWidget {
  String messageTitle;
  String messageDesc;

  NoTranscationMessage({required this.messageTitle, required this.messageDesc});

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
              SizedBox(height: 8,),
              Text(
                messageTitle,
                style: titleTextStyle.copyWith(color: darkBlue300),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
              messageDesc,
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
                  icon: const Icon(Icons.search),
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
