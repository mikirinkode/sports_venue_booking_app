import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:spod_app/model/checkbox_state.dart';
import 'package:spod_app/model/field_order.dart';
import 'package:spod_app/model/sport_field.dart';
import 'package:spod_app/modules/root/root_view.dart';
import 'package:spod_app/theme.dart';
import 'package:spod_app/utils/dummy_data.dart';
import 'package:spod_app/utils/time_utils.dart';

class BookingView extends StatefulWidget {
  SportField field;

  BookingView({required this.field});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  // DATE
  final int _currentMonth = TimeUtils.getCurrentMonth();
  final int _currentYear = TimeUtils.getCurrentYear();
  int _selectedMonth = TimeUtils.getCurrentMonth();
  String _selectedMonthName = TimeUtils.getCurrentMonthName();
  int _selectedYear = TimeUtils.getCurrentYear();
  final bool _isNextMonthValid = true;
  bool _isPrevMonthValid = false;
  List<int> _availableDates = TimeUtils.getAvailableDateList(
      month: TimeUtils.getCurrentMonth(), year: TimeUtils.getCurrentYear());
  int _selectedDate = 0;

  // TIME
  final String _selectedTime = "";

  final TextEditingController _controller = TextEditingController();
  final dateFormat = DateFormat("EEEE, dd MMM yyyy");
  int _totalBill = 0;
  bool _enableCreateOrderBtn = false;
  final List<String> _selectedTimes = [];

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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: colorWhite,
              statusBarIconBrightness: Brightness.dark,
            ),
            title: Text("Booking"),
            backgroundColor: colorWhite,
            centerTitle: true,
            foregroundColor: primaryColor500,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Venue Name",
                        style: subTitleTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: primaryColor100, width: 2),
                            color: lightBlue100,
                            borderRadius:
                                BorderRadius.circular(borderRadiusSize)),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/pin.png",
                              width: 24,
                              height: 24,
                              color: primaryColor500,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(widget.field.name,
                                style: normalTextStyle.copyWith(
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pick a date", style: subTitleTextStyle),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (_isPrevMonthValid) {
                                        setState(() {
                                          // update month and year
                                          if (_selectedMonth - 1 == 0) {
                                            _selectedMonth = 12;
                                            _selectedYear = _selectedYear - 1;
                                          } else {
                                            _selectedMonth = _selectedMonth - 1;
                                          }

                                          // update view
                                          _selectedMonthName =
                                              TimeUtils.getMonthNameWithLocale(
                                                  month: _selectedMonth);
                                          _isPrevMonthValid =
                                              _selectedMonth > _currentMonth ||
                                                  _selectedYear > _currentYear;
                                          _availableDates =
                                              TimeUtils.getAvailableDateList(
                                                  month: _selectedMonth,
                                                  year: _selectedYear);
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: (_isPrevMonthValid)
                                            ? neutral700
                                            : neutral50,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 16,
                                        color: (_isPrevMonthValid)
                                            ? Colors.white
                                            : neutral700,
                                      ),
                                    ),
                                  ),
                                  Text("$_selectedMonthName $_selectedYear", style: descTextStyle,),
                                  GestureDetector(
                                    onTap: () {
                                      if (_isNextMonthValid) {
                                        setState(() {
                                          // update month and year
                                          if (_selectedMonth + 1 == 13) {
                                            _selectedMonth = 1;
                                            _selectedYear = _selectedYear + 1;
                                          } else {
                                            _selectedMonth = _selectedMonth + 1;
                                          }

                                          // update view
                                          _selectedMonthName =
                                              TimeUtils.getMonthNameWithLocale(
                                                  month: _selectedMonth);
                                          _isPrevMonthValid =
                                              _selectedMonth > _currentMonth ||
                                                  _selectedYear > _currentYear;
                                          _availableDates =
                                              TimeUtils.getAvailableDateList(
                                                  month: _selectedMonth,
                                                  year: _selectedYear);
                                        });
                                      }
                                      debugPrint(
                                          "selected month = $_selectedMonthName, selected year: $_selectedYear");
                                      debugPrint(
                                          "_isPrevMonthValid = $_isPrevMonthValid");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: (_isNextMonthValid)
                                            ? neutral700
                                            : neutral50,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                        color: (_isNextMonthValid)
                                            ? Colors.white
                                            : neutral700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // const SizedBox(height: 16),
                              GridView.count(
                                crossAxisCount: 6,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                children: _availableDates
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedDate = e;
                                            });
                                          },
                                          child: Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: (_selectedDate == e)
                                                    ? primaryColor100
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: (_selectedDate == e)
                                                        ? primaryColor500
                                                        : neutral200,
                                                    width: 1)),
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              e.toString(),
                                              style: descTextStyle.copyWith(
                                                color: (_selectedDate == e)
                                                    ? primaryColor500
                                                    : neutral700,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pick a Time", style: subTitleTextStyle,),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: primaryColor100,
                                          border: Border.all(
                                              color: primaryColor500),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text("Choosed", style: descTextStyle,)
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: neutral200)),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text("Empty", style: descTextStyle,)
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: const BoxDecoration(
                                          color: neutral200,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text("Not Available", style: descTextStyle,)
                                    ],
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 16,),
                              GridView.count(
                                crossAxisCount: 4,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 2,
                                children: availableTimeList.map(
                                  (e) {
                                    final isSelected =
                                        _selectedTimes.contains(e.time);
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (e.isAvailable) {
                                            // _selectedTime = e.time;
                                            debugPrint(
                                                "selected time: $_selectedTime");

                                            if (_selectedTimes.contains(e.time)) {
                                              _selectedTimes.remove(e.time);
                                              _enableCreateOrderBtn =
                                                  _selectedTimes.isNotEmpty &&
                                                      _selectedDate != 0;
                                              _totalBill -= widget.field.price;
                                            } else {
                                              _selectedTimes.add(e.time);
                                              _enableCreateOrderBtn =
                                                  _selectedTimes.isNotEmpty &&
                                                      _selectedDate != 0;
                                              _totalBill += widget.field.price;
                                            }
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: (isSelected)
                                                ? primaryColor100
                                                : e.isAvailable
                                                    ? Colors.white
                                                    : neutral200,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: (isSelected)
                                                    ? primaryColor500
                                                    : e.isAvailable
                                                        ? neutral200
                                                        : neutral200,
                                                width: 1)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          e.time,
                                          style: descTextStyle.copyWith(
                                            color: (isSelected)
                                                ? primaryColor500
                                                : e.isAvailable
                                                    ? neutral700
                                                    : neutral500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: lightBlue300,
            offset: Offset(0, 0),
            blurRadius: 10,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
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
                          // List<String> selectedTime = [];
                          // for (int i = 0; i < availableBookTime.length; i++) {
                          //   if (availableBookTime[i].value) {
                          //     selectedTime.add(availableBookTime[i].title);
                          //   }
                          // }
                          DateTime selectedDateTime = DateTime(
                              _selectedYear, _selectedMonth, _selectedDate);

                          dummyUserOrderList.add(
                            FieldOrder(
                              field: widget.field,
                              user: sampleUser,
                              selectedDate: dateFormat.format(selectedDateTime).toString(),
                              selectedTime: _selectedTimes,
                            ),
                          );
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RootView(currentScreen: 1)),
                              (route) => false);
                          _showSnackBar(
                              context, "Successfully create an order");
                        },
                  child: Text(
                    "Create Order",
                    style: buttonTextStyle,
                  )),
            ),
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
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
