import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          toolbarHeight: kTextTabBarHeight,
          title: Text(
            "Settings",
            style: titleTextStyle,
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account",
                  style: subTitleTextStyle.copyWith(color: primaryColor500),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/user_pic.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Muhammad Wafa",
                          style: subTitleTextStyle,
                        ),
                        SizedBox(height: 8,),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: primaryColor100.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: primaryColor500
                            )
                          ),
                            child: Text("Premium", style: descTextStyle.copyWith(color: primaryColor500),))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment",
                        style: subTitleTextStyle.copyWith(color: primaryColor500),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: colorWhite),
                            child: Icon(
                              CupertinoIcons.creditcard_fill,
                              size: 24,
                              color: darkBlue300,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Payment method",
                                style: normalTextStyle,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Not Set",
                                style: descTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Other",
                        style: subTitleTextStyle.copyWith(color: primaryColor500),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: colorWhite),
                            child: Icon(
                              CupertinoIcons.moon_circle,
                              size: 24,
                              color: darkBlue300,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Theme",
                                style: normalTextStyle,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Light",
                                style: descTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: colorWhite),
                            child: Icon(
                              Icons.language_rounded,
                              size: 24,
                              color: darkBlue300,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Payment method",
                                style: normalTextStyle,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Not Set",
                                style: descTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 32,
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "App Version",
                        style: subTitleTextStyle.copyWith(color: primaryColor500),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: colorWhite),
                            child: Icon(
                              CupertinoIcons.info_circle_fill,
                              size: 24,
                              color: darkBlue300,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spod - Sports Field Booking App",
                                style: normalTextStyle,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Alpha Version",
                                style: descTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Created with ", style: normalTextStyle,),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "{code}",
                      style: subTitleTextStyle.copyWith(color: primaryColor500),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text("and", style: normalTextStyle,),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
