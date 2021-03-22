library simple_vertical_calendar.src.day;

import 'package:flutter/material.dart';
import 'package:simple_vertical_calendar/src/customization/day_style.dart';

/**
 * TODO: Implement CustomWidget Builder for Day 
 */
///
class DayWidget extends StatelessWidget {
  final String thisHeaderText;
  final DayHeaderStyle? dayOfWeekStyle;
  final double? boxHeight;
  final bool? isInRange;
  final bool? isFirstOrLast;
  final bool? isValidDate;
  const DayWidget(
    this.thisHeaderText, {
    this.dayOfWeekStyle,
    this.boxHeight,
    this.isInRange,
    this.isFirstOrLast,
    this.isValidDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
