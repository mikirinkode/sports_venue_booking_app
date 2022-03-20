import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spod_app/model/sport_category.dart';
import 'package:spod_app/screen/detail_screen.dart';
import 'package:spod_app/screen/search_screen.dart';
import 'package:spod_app/theme.dart';
import 'package:spod_app/utils/dummy_data.dart';

import '../model/sport_field.dart';
import '../widget/category_card.dart';
import '../widget/sport_field_card.dart';

class HomeScreen extends StatelessWidget {
  List<SportField> fieldList = sportFieldList;
  final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue100,
      body: Stack(
        children: [
          ListView(children: [
            // HEADER
            fakeHeader(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text(
                "Popular Categories",
                style: subTitleTextStyle.copyWith(color: darkBlue300),
              ),
            ),

            CategoryListView(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Fields",
                    style: subTitleTextStyle.copyWith(color: darkBlue300),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SearchScreen();
                    }));
                  }, child: Text("See All"))
                ],
              ),
            ),

            // RECOMMENDED FIELDS
            Column(
                children: fieldList
                    .map((fieldEntity) => SportFieldCard(
                          field: fieldEntity,
                        ))
                    .toList()),
            // SportFieldListView(),
          ]),
          header(context),
        ],
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
        // SEARCH Icon
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                backgroundColor: lightBlue100, child: Image.asset("assets/images/user.png", color: primaryColor, width: 24, height: 24,)),
            IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchScreen();
                }));
              },
              icon: Icon(Icons.search, color: colorWhite),
            )
          ],
        ),
      ),
    );
  }

  Widget fakeHeader() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(borderRadiusSize))),
      child: SafeArea(
        // SEARCH Icon
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundColor: lightBlue100, child: Icon(Icons.person)),
            SizedBox(height: 24.0,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back", style: subTitleTextStyle.copyWith(color: colorWhite),
                ),
                Text(
                  "Let's have fun & be healthy!",
                  style: descTextStyle.copyWith(color: lightBlue100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
