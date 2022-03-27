import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme.dart';

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
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account",
                  style: subTitleTextStyle.copyWith(color: primaryColor500),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/user_pic.png"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Muhammad Wafa",
                          style: subTitleTextStyle,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: primaryColor100.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: primaryColor500)),
                            child: Text(
                              "Premium",
                              style: descTextStyle.copyWith(
                                  color: primaryColor500),
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Payment",
                  style: subTitleTextStyle.copyWith(color: primaryColor500),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: primaryColor100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: colorWhite),
                          child: const Icon(
                            CupertinoIcons.creditcard_fill,
                            size: 24,
                            color: darkBlue300,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Current Payment method",
                              style: normalTextStyle,
                            ),
                            const SizedBox(
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
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Other",
                  style: subTitleTextStyle.copyWith(color: primaryColor500),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: primaryColor100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: colorWhite),
                          child: const Icon(
                            CupertinoIcons.moon_circle,
                            size: 24,
                            color: darkBlue300,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Theme",
                              style: normalTextStyle,
                            ),
                            const SizedBox(
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
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: primaryColor100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: colorWhite),
                          child: const Icon(
                            Icons.language_rounded,
                            size: 24,
                            color: darkBlue300,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Language",
                              style: normalTextStyle,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "English",
                              style: descTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "App Version",
                  style: subTitleTextStyle.copyWith(color: primaryColor500),
                ),
                InkWell(
                  onTap: () {
                    _showSnackBar(context, "Newest Version");
                  },
                  splashColor: primaryColor100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: colorWhite),
                          child: const Icon(
                            CupertinoIcons.info_circle_fill,
                            size: 24,
                            color: darkBlue300,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spod - Sports Field Booking App",
                              style: normalTextStyle,
                            ),
                            const SizedBox(
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
                  ),
                ),

                InkWell(

                  onTap: () => launch("https://github.com/mikirinkode"),
                  splashColor: primaryColor100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: colorWhite),
                          child: Image.asset(
                            "assets/icons/github.png",
                            color: darkBlue300,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Github",
                              style: normalTextStyle,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "github.com/mikirinkode",
                              style: descTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Created with ",
                      style: normalTextStyle,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "{code}",
                      style: subTitleTextStyle.copyWith(color: primaryColor500),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "and",
                      style: normalTextStyle,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
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

  void _showSnackBar(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      margin: const EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      // margin: EdgeInsets.all(16),
    ));
  }
}
