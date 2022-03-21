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
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(context, field),
          SliverPadding(
            padding: EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/pin.png",
                      width: 24,
                      height: 24,
                      color: primaryColor500,
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
                SizedBox(height: 16,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: primaryColor500,),
                    SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        field.phoneNumber,
                        overflow: TextOverflow.visible,
                        style: addressTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle_rounded, color: primaryColor500,),
                    SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        field.author,
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
                    TextButton(onPressed: () {}, child: Text("See Availability"))
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      color: primaryColor500,
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
                      color: primaryColor500,
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
                FacilityCardList(facilities: field.facilities),
              ]),
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
                  field.price.toString(),
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

  Widget customSliverAppBar(context, field) {
    return SliverAppBar(
      shadowColor: primaryColor500.withOpacity(.2),
      backgroundColor: colorWhite,
      // floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: kToolbarHeight,
          decoration: BoxDecoration(
          color: colorWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadiusSize))
          ),
          child: Center(
            child: Text(
              field.name,
              style: titleTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        background: Image.asset(
          field.imageAsset,
          fit: BoxFit.cover,
        ),
        collapseMode: CollapseMode.parallax,
      ),
      leading: Container(
        decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(borderRadiusSize))),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: darkBlue700,
            )),
      ),
      expandedHeight: 300,
    );
  }
}
