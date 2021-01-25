library vertical_calendar.src.helper;

bool checkInvalidDate(int index, List<DateTime> days, {DateTime current}) {
  if (current != null)
    return index >= days.length ||
        days[index] == null ||
        days[index].isBefore(current);
  else
    return index >= days.length || days[index] == null;
}

bool checkInRange(DateTime currentDate, DateTime startDate, DateTime endDate) {
  if (startDate == null || endDate == null) return false;
  if (currentDate.isBefore(endDate) && currentDate.isAfter(startDate) ||
      currentDate == endDate ||
      currentDate == startDate) {
    return true;
  }
  return false;
}

bool checkIsFirstOrLast(
    DateTime currentDate, DateTime startDate, DateTime endDate) {
  if (currentDate.isSameDate(startDate) || currentDate.isSameDate(endDate)) {
    return true;
  }
  return false;
}

List<DateTime> populateDate(DateTime date) {
  var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);

  List<DateTime> dt = List<DateTime>();
  for (var i = 0;
      i < firstDayNextMonth.difference(firstDayThisMonth).inDays;
      i++) {
    dt.add(DateTime(firstDayThisMonth.year, firstDayThisMonth.month, 1 + i));
  }
  if (dt.first.weekday > 1)
    dt.insertAll(
        0, List<DateTime>.generate(dt.first.weekday - 1, (index) => null));
  return dt;
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
