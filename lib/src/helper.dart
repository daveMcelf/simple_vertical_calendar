///helper function for SimpleVerticalCalendar.
library simple_vertical_calendar.src.helper;

/// check for invalid within the list of date given the index.
bool checkInvalidDate(int index, List<DateTime?> days, {DateTime? current}) {
  if (current != null)
    return index >= days.length ||
        days[index] == null ||
        days[index]!.isBefore(current);
  else
    return index >= days.length || days[index] == null;
}

/// check if date is in between Start Date and End Date.
bool checkInRange(
    DateTime currentDate, DateTime? startDate, DateTime? endDate) {
  if (startDate == null || endDate == null) return false;
  if (currentDate.isBefore(endDate) && currentDate.isAfter(startDate) ||
      currentDate == endDate ||
      currentDate == startDate) {
    return true;
  }
  return false;
}

/// check if date is one of Start Date or End Date
bool checkIsFirstOrLast(
    DateTime currentDate, DateTime startDate, DateTime endDate) {
  if (currentDate.isSameDate(startDate) || currentDate.isSameDate(endDate)) {
    return true;
  }
  return false;
}

/// generate a list of Date for each month
List<DateTime?> populateDate(DateTime date) {
  var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);

  List<DateTime?> dt = <DateTime>[];
  for (var i = 0;
      i < firstDayNextMonth.difference(firstDayThisMonth).inDays;
      i++) {
    dt.add(DateTime(firstDayThisMonth.year, firstDayThisMonth.month, 1 + i));
  }
  if (dt.first!.weekday > 1)
    dt.insertAll(
        0, List<DateTime?>.generate(dt.first!.weekday - 1, (index) => null));
  return dt;
}

/// Date extension to check if Date is the same
extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
