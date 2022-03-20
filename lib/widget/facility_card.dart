import 'package:flutter/material.dart';

import '../theme.dart';

class FacilityCard extends StatefulWidget {
  String imageIcon;
  String name;

  FacilityCard({required this.imageIcon, required this.name});

  @override
  State<FacilityCard> createState() => _FacilityCardState();
}

class _FacilityCardState extends State<FacilityCard> {
  bool showName = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: lightBlue100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        splashColor: lightBlue300,
        onTap: () {
          setState(() {
            showName = !showName;
          });
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.all(4.0),
            child: Center(
              child: !showName
                  ? Image.asset(
                      widget.imageIcon,
                      width: 30,
                      height: 30,
                      color: primaryColor,
                    )
                  : Text(
                      widget.name,
                      style: facilityTextStyle,
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
