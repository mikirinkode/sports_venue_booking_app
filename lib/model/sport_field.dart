import 'package:spod_app/model/sport_category.dart';
import 'package:spod_app/model/field_facility.dart';

class SportField {
  String id;
  String name;
  SportCategory category;
  List<FieldFacility> facilities;
  String address;
  String phoneNumber;
  String openDay;
  String openTime;
  String closeTime;
  String imageAsset;
  int price;
  String author;
  String authorUrl;
  String imageUrl;

  SportField(
      {required this.id,
      required this.name,
      required this.category,
      required this.facilities,
      required this.address,
      required this.phoneNumber,
      required this.openDay,
      required this.openTime,
      required this.closeTime,
      required this.imageAsset,
      required this.price,
      required this.author,
      required this.authorUrl,
      required this.imageUrl});
}
