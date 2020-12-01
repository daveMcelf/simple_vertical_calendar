library vertical_calendar.src.day_of_week;

import 'package:flutter/material.dart';
import 'package:vertical_calendar/src/customization/dayofweek_style.dart';

class DayOfWeekWidget extends StatelessWidget {
  final String thisHeaderText;
  final DayOfWeekHeaderStyle dayOfWeekStyle;
  const DayOfWeekWidget(
    this.thisHeaderText, {
    this.dayOfWeekStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: dayOfWeekStyle.backgroundStyle,
      margin: dayOfWeekStyle.margin,
      padding: dayOfWeekStyle.padding,
      child: Text(
        thisHeaderText,
        style: dayOfWeekStyle.textStyle,
        textAlign: dayOfWeekStyle.textAlgin,
      ),
    );
  }
}
