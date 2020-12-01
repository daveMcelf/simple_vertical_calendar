library vertical_calendar.src.calendar;

import 'package:flutter/material.dart';
import 'package:vertical_calendar/src/customization/header_style.dart';
import 'package:vertical_calendar/src/day_of_week.dart';
import 'package:vertical_calendar/src/header.dart';
import 'package:vertical_calendar/vertical_calendar.dart';

class VerticalCalendar extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final int numOfMonth;
  final HeaderStyle headerStyle;
  final DayOfWeekHeaderStyle dayOfWeekHeaderStyle;
  final List<String> dayOfWeek;

  final void Function(DateTime startDate, DateTime endDate) onDateTap;
  VerticalCalendar(
      {this.startDate,
      this.endDate,
      this.numOfMonth = 12,
      this.headerStyle = const HeaderStyle(),
      this.onDateTap,
      this.dayOfWeekHeaderStyle = const DayOfWeekHeaderStyle(),
      this.dayOfWeek = const ["M", "T", "W", "T", "F", "S", "S"]});
  @override
  _VerticalCalendarState createState() => _VerticalCalendarState();
}

class _VerticalCalendarState extends State<VerticalCalendar> {
  DateTime current;
  int startMonth;
  int endMonth;
  DateTime startDate;
  DateTime endDate;

  _VerticalCalendarState({
    this.current,
    this.startMonth,
    this.endMonth,
    this.startDate,
    this.endDate,
  });
  @override
  void initState() {
    current = DateTime.now();
    startMonth = current.month;
    endMonth = startMonth + widget.numOfMonth;
    startDate = widget.startDate;
    endDate = widget.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: ListView.builder(
        itemCount: widget.numOfMonth,
        itemBuilder: (context, index) {
          DateTime currentListMonth =
              DateTime(current.year, current.month + index, current.day);
          List<DateTime> days = populateDate(currentListMonth);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(
                currentListMonth,
                headerStyle: widget.headerStyle,
              ),
              SizedBox(height: 10),
              Table(
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                      ),
                    ),
                    children: [
                      for (var i in widget.dayOfWeek)
                        DayOfWeekWidget(
                          i,
                          dayOfWeekStyle: widget.dayOfWeekHeaderStyle,
                        ),
                    ],
                  ),
                  for (var d = 0; d <= days.length ~/ 7; d++)
                    if (d * 7 < days.length)
                      TableRow(
                        children: [
                          for (var w = 0; w < 7; w++)
                            InkWell(
                              onTap: (d * 7 + w) >= days.length ||
                                      days[d * 7 + w] != null &&
                                          days[d * 7 + w].isBefore(current)
                                  ? null
                                  : () {
                                      if (startDate == null ||
                                          startDate.compareTo(days[d * 7 + w]) >
                                              0) {
                                        setState(() {
                                          startDate = days[d * 7 + w];
                                          endDate = days[d * 7 + w];
                                        });
                                      } else if (startDate.compareTo(endDate) ==
                                          0) {
                                        setState(() {
                                          endDate = days[d * 7 + w];
                                        });
                                      } else {
                                        setState(() {
                                          startDate = days[d * 7 + w];
                                          endDate = days[d * 7 + w];
                                        });
                                      }
                                      widget.onDateTap(startDate, endDate);
                                    },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (!((d * 7 + w) >= days.length ||
                                          days[d * 7 + w] == null) &&
                                      startDate != null &&
                                      endDate != null)
                                    Container(
                                      height:
                                          (MediaQuery.of(context).size.width -
                                                      70) /
                                                  7 -
                                              10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: startDate.compareTo(
                                                      days[d * 7 + w]) ==
                                                  0
                                              ? Radius.circular(
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          70) /
                                                      14)
                                              : Radius.circular(0),
                                          bottomLeft: startDate.compareTo(
                                                      days[d * 7 + w]) ==
                                                  0
                                              ? Radius.circular(
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          70) /
                                                      14)
                                              : Radius.circular(0),
                                          topRight: endDate.compareTo(
                                                      days[d * 7 + w]) ==
                                                  0
                                              ? Radius.circular(
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          70) /
                                                      14)
                                              : Radius.circular(0),
                                          bottomRight: endDate.compareTo(
                                                      days[d * 7 + w]) ==
                                                  0
                                              ? Radius.circular(
                                                  (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          70) /
                                                      14)
                                              : Radius.circular(0),
                                        ),
                                        color: startDate.compareTo(
                                                        days[d * 7 + w]) >
                                                    0 ||
                                                endDate.compareTo(
                                                        days[d * 7 + w]) <
                                                    0
                                            ? Colors.white
                                            : Color(0xFF007AFF)
                                                .withOpacity(0.3),
                                      ),
                                    ),
                                  Container(
                                    width: double.maxFinite,
                                    height: (MediaQuery.of(context).size.width -
                                            70) /
                                        7,
                                    alignment: Alignment.center,
                                    decoration: (!((d * 7 + w) >= days.length ||
                                                days[d * 7 + w] == null) &&
                                            startDate != null &&
                                            endDate != null)
                                        ? BoxDecoration(
                                            borderRadius: startDate.compareTo(
                                                            days[d * 7 + w]) ==
                                                        0 ||
                                                    endDate.compareTo(
                                                            days[d * 7 + w]) ==
                                                        0
                                                ? BorderRadius.circular(
                                                    (MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            70) /
                                                        14)
                                                : BorderRadius.circular(0),
                                            color: startDate.compareTo(
                                                            days[d * 7 + w]) ==
                                                        0 ||
                                                    endDate.compareTo(
                                                            days[d * 7 + w]) ==
                                                        0
                                                ? Color(0xFF007AFF)
                                                : Colors.transparent,
                                          )
                                        : BoxDecoration(),
                                    child: Text(
                                      (d * 7 + w) >= days.length ||
                                              days[d * 7 + w] == null
                                          ? ""
                                          : days[d * 7 + w]?.day?.toString() ??
                                              "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: (d * 7 + w) >= days.length ||
                                                days[d * 7 + w] == null ||
                                                days[d * 7 + w]
                                                    .isBefore(current)
                                            ? Colors.grey
                                            : startDate != null &&
                                                    endDate != null &&
                                                    (startDate.compareTo(days[
                                                                d * 7 + w]) ==
                                                            0 ||
                                                        endDate.compareTo(days[
                                                                d * 7 + w]) ==
                                                            0)
                                                ? Colors.white
                                                : Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                ],
              ),
              SizedBox(height: 30),
            ],
          );
        },
      ),
    );
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
}
