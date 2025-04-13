import 'package:intl/intl.dart';

class TimeUtils {
  TimeUtils._();

  static int getCurrentMonth() => DateTime.now().month;

  static int getCurrentYear() => DateTime.now().year;

  static String getMonthNameWithLocale({
    required int month,
    String locale = 'en', // The locale to use
  }) {
    final date = DateTime(2020, month); // Year can be any value
    return DateFormat.MMMM(locale)
        .format(date);
  }

  static String getCurrentMonthName() => getMonthNameWithLocale(month: getCurrentMonth());

  static List<int> getAvailableDateList({
    required int month,
    required int year,
  }) {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(year, month + 1, 0).day;

    int startDay = (month == now.month && year == now.year) ? now.day : 1;

    return List.generate(
        daysInMonth - startDay + 1, (index) => index + startDay);
  }
}
