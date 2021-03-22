library simple_vertical_calendar.src.calendar;

import 'package:flutter/material.dart';
import 'package:simple_vertical_calendar/src/customization/day_style.dart';
import 'package:simple_vertical_calendar/src/customization/dayofweek_style.dart';
import 'package:simple_vertical_calendar/src/customization/header_style.dart';
import 'package:simple_vertical_calendar/src/day_of_week.dart';
import 'package:simple_vertical_calendar/src/header.dart';
import 'package:simple_vertical_calendar/src/helper.dart';

/// [SimpleVerticalCalendar] is the widget for scrollable vertical calendar that is similar to the one in AirBnB.
///
/// This widget is highly customizable where user can style different part of the widget according to their like.
/// using this widget user can specify:
/// startDate, endDate, numOfMonth, headerStyle, dayStyle, dayOfWeekHeaderStyle, dayOfWeek.
///
/// ```
/// SimpleVerticalCalendar(
///     numOfMonth: 6,
///     headerStyle: HeaderStyle(
///         titleTextStyle: TextStyle(
///             color: Colors.black,
///             fontSize: 20,
///             fontWeight: FontWeight.bold,
///         ),
///         textAlgin: TextAlign.left,
///         monthFormat: MonthFormats.FULL,
///     ),
///     dayOfWeekHeaderStyle: DayOfWeekHeaderStyle(),
///     dayStyle: DayHeaderStyle(
///         textColor: Colors.black,
///     ),
///     onDateTap: (start, end) {
///         print(start);
///         print(end);
///     },
/// ),
/// ```
class SimpleVerticalCalendar extends StatefulWidget {
  /// the default selected start date when initialize the calendar
  final DateTime? startDate;

  /// the default selected end date when initialize the calendar
  final DateTime? endDate;

  /// Number of Month to display in the calendar.
  ///
  /// For example: `numOfMonth = 6` will include the next 6 months to calendar.
  final int numOfMonth;

  /// Styling your Month Header widget using [HeaderStyle].
  final HeaderStyle headerStyle;

  /// Styling your Day widget using [DayHeaderStyle].
  final DayHeaderStyle dayStyle;

  /// Styling your Day of the week widget using [DayOfWeekHeaderStyle].
  final DayOfWeekHeaderStyle dayOfWeekHeaderStyle;

  ///[dayOfWeek] is a list of String that display in text for your Day of Week Widget.
  ///
  /// For example: `dayOfWeek = const ["M", "T", "W", "T", "F", "S", "S"]`
  ///
  /// where index of Monday = 0, and Sunday = 6.
  final List<String> dayOfWeek;

  final void Function(DateTime startDate, DateTime endDate)? onDateTap;
  SimpleVerticalCalendar(
      {this.startDate,
      this.endDate,
      this.numOfMonth = 12,
      this.headerStyle = const HeaderStyle(),
      this.dayStyle = const DayHeaderStyle(),
      this.onDateTap,
      this.dayOfWeekHeaderStyle = const DayOfWeekHeaderStyle(),
      this.dayOfWeek = const ["M", "T", "W", "T", "F", "S", "S"]});
  @override
  _VerticalCalendarState createState() => _VerticalCalendarState();
}

class _VerticalCalendarState extends State<SimpleVerticalCalendar> {
  DateTime? current;
  int? startMonth;
  int? endMonth;
  DateTime? startDate;
  DateTime? endDate;
  double? boxHeight;
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
    startMonth = current!.month;
    endMonth = startMonth! + widget.numOfMonth;
    startDate = widget.startDate;
    endDate = widget.endDate;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    boxHeight = (MediaQuery.of(context).size.width - 70) / 7;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: ListView.builder(
        itemCount: widget.numOfMonth,
        itemBuilder: (context, index) {
          DateTime currentListMonth =
              DateTime(current!.year, current!.month + index, current!.day);
          List<DateTime?> days = populateDate(currentListMonth);
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
                                          days[d * 7 + w]!.isBefore(current!)
                                  ? null
                                  : () {
                                      if (startDate == null ||
                                          startDate!
                                                  .compareTo(days[d * 7 + w]!) >
                                              0) {
                                        setState(() {
                                          startDate = days[d * 7 + w];
                                          endDate = days[d * 7 + w];
                                        });
                                      } else if (startDate!
                                              .compareTo(endDate!) ==
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
                                      widget.onDateTap!(startDate!, endDate!);
                                    },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (!checkInvalidDate(d * 7 + w, days))
                                    if (checkInRange(
                                        days[d * 7 + w]!, startDate, endDate))
                                      Container(
                                        width: double.maxFinite,
                                        height: boxHeight! - 10,
                                        decoration: BoxDecoration(
                                          color: widget.dayStyle
                                              .dateInRangeBackgroundColor,
                                        ),
                                        margin: EdgeInsets.only(
                                          left: startDate == days[d * 7 + w]
                                              ? boxHeight! / 2
                                              : 0,
                                          right: endDate == days[d * 7 + w]
                                              ? boxHeight! / 2
                                              : 0,
                                        ),
                                      ),
                                  Container(
                                    width: double.maxFinite,
                                    height: boxHeight,
                                    alignment: Alignment.center,
                                    decoration: (!checkInvalidDate(
                                                d * 7 + w, days) &&
                                            startDate != null &&
                                            endDate != null)
                                        ? BoxDecoration(
                                            borderRadius: checkIsFirstOrLast(
                                                    days[d * 7 + w]!,
                                                    startDate!,
                                                    endDate!)
                                                ? BorderRadius.circular(
                                                    boxHeight! / 2)
                                                : BorderRadius.circular(0),
                                            color: checkIsFirstOrLast(
                                                    days[d * 7 + w]!,
                                                    startDate!,
                                                    endDate!)
                                                ? widget.dayStyle
                                                    .selectedBackgroundColor
                                                : Colors.transparent,
                                          )
                                        : BoxDecoration(),
                                    child: Text(
                                      checkInvalidDate(d * 7 + w, days)
                                          ? ""
                                          : days[d * 7 + w]?.day.toString() ??
                                              "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: checkInvalidDate(d * 7 + w, days,
                                                current: current)
                                            ? widget
                                                .dayStyle.unavailableTextColor
                                            : checkInRange(days[d * 7 + w]!,
                                                    startDate, endDate)
                                                ? widget
                                                    .dayStyle.selectedTextColor
                                                : widget.dayStyle.textColor,
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
}
