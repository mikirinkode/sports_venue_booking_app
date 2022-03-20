import 'package:flutter/material.dart';

import '../theme.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Container(
          child: header(context),
        ),
    );
  }
  Widget header(context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(borderRadiusSize))),
      child: SafeArea(
        // SEARCH BAR
        child: Container(
          decoration: BoxDecoration(
              color: lightBlue100,
              borderRadius: BorderRadius.circular(borderRadiusSize)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_rounded)),
              Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(borderRadiusSize)),
                  child: Icon(
                    Icons.search,
                    color: primaryColor,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Search Sport Fields...",
                  style: buttonTextStyle.copyWith(color: darkBlue300),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
