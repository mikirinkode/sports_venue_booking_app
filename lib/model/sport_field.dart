import 'package:spod_app/model/sport_category.dart';
import 'package:spod_app/model/field_facility.dart';

class SportField {
  String id;
  String name;
  SportCategory category;
  List<FieldFacility> facilities;
  String address;
  String author;
  String phoneNumber;
  String openDay;
  String openTime;
  String imageAsset;
  int price;

  SportField(
      {required this.id,
      required this.name,
      required this.category,
      required this.facilities,
      required this.address,
      required this.author,
      required this.phoneNumber,
      required this.openDay,
      required this.openTime,
      required this.imageAsset,
      required this.price});
}
