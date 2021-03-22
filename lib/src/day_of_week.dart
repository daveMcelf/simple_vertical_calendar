library simple_vertical_calendar.src.day_of_week;

import 'package:flutter/material.dart';
import 'package:simple_vertical_calendar/src/customization/dayofweek_style.dart';

/// [DayOfWeekWidget] is the widget for building DayOfWeek section of the calendar.
class DayOfWeekWidget extends StatelessWidget {
  ///Display text for this widget
  final String thisHeaderText;

  ///Styling specify by user
  final DayOfWeekHeaderStyle? dayOfWeekStyle;
  const DayOfWeekWidget(
    this.thisHeaderText, {
    this.dayOfWeekStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: dayOfWeekStyle?.backgroundStyle,
      margin: dayOfWeekStyle?.margin,
      padding: dayOfWeekStyle?.padding,
      child: Text(
        thisHeaderText,
        style: dayOfWeekStyle?.textStyle,
        textAlign: dayOfWeekStyle?.textAlgin,
      ),
    );
  }
}
