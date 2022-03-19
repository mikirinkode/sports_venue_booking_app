import 'package:flutter/material.dart';

import '../theme.dart';

class FacilityWidget extends StatefulWidget {
  String imageIcon;
  String name;

  FacilityWidget({required this.imageIcon, required this.name});

  @override
  State<FacilityWidget> createState() => _FacilityWidgetState();
}

class _FacilityWidgetState extends State<FacilityWidget> {
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
            padding: EdgeInsets.all(8.0),
            // decoration: BoxDecoration(
            //     color: lightBlue100, borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: !showName ?
              Image.asset(
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