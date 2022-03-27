import 'package:spod_app/model/sport_field.dart';

class FieldOrder {
  SportField field;
  String user;
  String selectedDate;
  List<String> selectedTime;
  bool paidStatus;

  FieldOrder(
      {required this.field,
      required this.user,
      required this.selectedDate,
      required this.selectedTime,
      this.paidStatus = false});
}
