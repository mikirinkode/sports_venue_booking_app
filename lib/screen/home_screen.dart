import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: Column(
        children: [
          header(context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text("Let's Have Fun and \nBe Healty!", style: greetingTextStyle,),
                ),
                CategoryListView(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Fields",
                        style: subTitleTextStyle,
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return SearchScreen();
                        }));
                      }, child: Text("Show All"))
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
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget header(context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SafeArea(
        // SEARCH Icon
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height:55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/user_pic.png"),
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back,",
                      style: descTextStyle,
                    ),
                    Text(
                      "Muhammad Wafa",
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor500,
                  borderRadius:
                  BorderRadius.circular(borderRadiusSize)),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchScreen();
                  }));
                },
                icon: Icon(Icons.search, color: colorWhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}
