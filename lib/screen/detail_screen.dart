import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme.dart';
import '../widget/facility_widget.dart';

class DetailScreen extends StatelessWidget {
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
              "assets/images/pringsewu_futsal.jpg",
              width: MediaQuery.of(context).size.width,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          ListView(
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
                        "Pringsewu Futsal",
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
                              "Jln. Jendral Sudirman no.31",
                              overflow: TextOverflow.visible,
                              style: addressTextStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Availability:",
                        style: subTitleTextStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/date.png",
                            width: 21,
                            height: 21,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            "Sunday to Saturday",
                            style: descTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/clock.png",
                            width: 20,
                            height: 20,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            "09.00 - 17.00",
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
                      GridView.count(
                        crossAxisCount: 4,
                        physics: const ClampingScrollPhysics(),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: (1 / 1),
                        shrinkWrap: true,
                        children: [
                          FacilityWidget(
                              imageIcon: "assets/icons/wifi.png", name: "Wifi"),
                          FacilityWidget(
                              imageIcon: "assets/icons/toilet.png",
                              name: "Toilet"),
                          FacilityWidget(
                              imageIcon: "assets/icons/changing_room.png",
                              name: "Changing Room"),
                          FacilityWidget(
                              imageIcon: "assets/icons/canteen.png",
                              name: "Canteen"),
                          FacilityWidget(
                              imageIcon: "assets/icons/lockers.png",
                              name: "Lockers"),
                          FacilityWidget(
                              imageIcon: "assets/icons/charging.png",
                              name: "Charging"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colorWhite,
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back, color: darkBlue700,)),
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
            offset: Offset(0,0),
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
                Text("Price / hour", style: descTextStyle,),
                Text("Rp. 50.000",
                style: priceTextStyle,),
              ],
            ),
            SizedBox(width: 24,),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))
                ),
                  onPressed: () {
              }, child: Text("Book Now")),
            )
          ],
        ),
      ),
    );
  }
}
