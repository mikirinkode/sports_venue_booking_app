import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spod_app/main.dart';
import 'package:spod_app/model/checkbox_state.dart';
import 'package:spod_app/model/field_order.dart';
import 'package:spod_app/model/sport_field.dart';
import 'package:spod_app/theme.dart';
import 'package:spod_app/utils/dummy_data.dart';


class CheckoutScreen extends StatefulWidget {
  SportField field;

  CheckoutScreen({required this.field});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _controller = TextEditingController();
  DateTime _dateTime = DateTime.now();
  final dateFormat = DateFormat("E, dd MM yyyy");
  final availableBookTime = [
    CheckBoxState(title: "07.00 - 08.00"),
    CheckBoxState(title: "09.00 - 10.00"),
    CheckBoxState(title: "11.00 - 12.00"),
  ];
  int _totalBill = 0;
  bool _enableCreateOrderBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Field Name",
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor100, width: 2),
                  color: lightBlue100,
                  borderRadius: BorderRadius.circular(borderRadiusSize)),
              child: Text(widget.field.name,
                  style: normalTextStyle.copyWith(fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Pick a date",
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                _selectDate();
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor100, width: 2),
                    color: lightBlue100,
                    borderRadius: BorderRadius.circular(borderRadiusSize)),
                child: Text(
                  _dateTime == null
                      ? "date not selected.."
                      : dateFormat.format(_dateTime).toString(),
                  style: normalTextStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Pick a Time",
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            ...availableBookTime.map(buildSingleCheckBox).toList(),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total:",
                      style: descTextStyle,
                    ),
                    Text(
                      "Rp $_totalBill",
                      style: priceTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(borderRadiusSize))),
                      onPressed: !_enableCreateOrderBtn
                          ? null
                          : () {
                              List<String> selectedTime = [];
                              for (int i = 0;
                                  i < availableBookTime.length;
                                  i++) {
                                if (availableBookTime[i].value) {
                                  selectedTime.add(availableBookTime[i].title);
                                }
                              }
                              dummyUserOrderList.add(FieldOrder(
                                  field: widget.field,
                                  user: "Muhammad Wafa",
                                  selectedDate:
                                      dateFormat.format(_dateTime).toString(),
                                  selectedTime: selectedTime));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MainScreen(currentScreen: 1);
                              }));
                              _showSnackBar(
                                  context, "Successfully create an order");
                            },
                      child: Text(
                        "Create Order",
                        style: buttonTextStyle,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectDate() async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022, 3),
            lastDate: DateTime(2022, 4))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(checkbox.title),
      value: checkbox.value,
      onChanged: (bool? value) {
        setState(() {
          checkbox.value = value!;
        });
        int totalSelectedTime = 0;
        for (int i = 0; i < availableBookTime.length; i++) {
          if (availableBookTime[i].value == true) {
            totalSelectedTime++;
          }
        }
        setState(() {
          _totalBill = widget.field.price * totalSelectedTime;
          if (totalSelectedTime > 0) {
            _enableCreateOrderBtn = true;
          } else {
            _enableCreateOrderBtn = false;
          }
        });
      },
    );
  }
}
