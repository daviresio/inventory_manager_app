class DateHelper {
  static const months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

  static bool isToday(DateTime date) {
    return date.day == DateTime.now().day;
  }

  static String getMinthInitials(DateTime date) {
    return months[date.month]!.substring(0, 3);
  }
}
