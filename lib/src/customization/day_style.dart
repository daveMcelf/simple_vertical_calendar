library simple_vertical_calendar.src.customization.day_style;

import 'package:flutter/material.dart';

/// [DayHeaderStyle] is the styling class for Day widget.
///
/// Using this style, you can specify all colors that you want for your Day.
///
/// The currently available style are: backgroundColor, selectedBackgroundColor
/// dateInRangeBackgroundColor, textColor, selectedTextColor, unavailableTextColor.

class DayHeaderStyle {
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Color dateInRangeBackgroundColor;
  final Color textColor;
  final Color selectedTextColor;
  final Color unavailableTextColor;
  const DayHeaderStyle({
    this.backgroundColor = Colors.transparent,
    this.selectedBackgroundColor = Colors.black,
    this.dateInRangeBackgroundColor = Colors.black45,
    this.textColor = Colors.black,
    this.selectedTextColor = Colors.white,
    this.unavailableTextColor = Colors.grey,
  });
}
