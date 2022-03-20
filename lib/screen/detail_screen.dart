import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spod_app/model/sport_field.dart';
import '../theme.dart';
import '../widget/facility_card.dart';

class DetailScreen extends StatelessWidget {
  SportField field;

  DetailScreen({required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: darkBlue300,
            ),
            child: Image.asset(
              field.imageAsset,
              width: MediaQuery.of(context).size.width,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: 260,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          field.name,
                          style: titleTextStyle,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/pin.png",
                              width: 25,
                              height: 25,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Flexible(
                              child: Text(
                                field.address,
                                overflow: TextOverflow.visible,
                                style: addressTextStyle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Availability:",
                              style: subTitleTextStyle,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text("See Availability"))
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range_rounded,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              field.openDay,
                              style: descTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              field.openTime,
                              style: descTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Facilities:",
                          style: subTitleTextStyle,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FacilityCardList(facilities: field.facilities)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colorWhite,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: darkBlue700,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: lightBlue300,
            offset: Offset(0, 0),
            blurRadius: 10,
          ),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price / hour",
                  style: descTextStyle,
                ),
                Text(
                  "Rp. 50.000",
                  style: priceTextStyle,
                ),
              ],
            ),
            SizedBox(
              width: 24,
            ),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderRadiusSize))),
                  onPressed: () {},
                  child: Text("Book Now")),
            )
          ],
        ),
      ),
    );
  }
}
