
import 'package:flutter/material.dart';
import 'package:spod_app/model/field_facility.dart';

import '../theme.dart';

class FacilityCardList extends StatelessWidget{
  List<FieldFacility> facilities;

  FacilityCardList({required this.facilities});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      physics: const ClampingScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: EdgeInsets.zero,
      childAspectRatio: (1 / 1),
      shrinkWrap: true,
      children: facilities.map((facility) {
        return FacilityCard(name: facility.name, imageIcon: facility.imageAsset);
      }).toList(),
    );
  }

}

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
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: !showName
                  ? Image.asset(
                widget.imageIcon,
                width: 30,
                height: 30,
                color: primaryColor500,
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