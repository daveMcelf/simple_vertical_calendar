library simple_vertical_calendar.src.customization.dayofweek_style;

import 'package:flutter/material.dart';

/// [DayOfWeekHeaderStyle] is the styling class for Day of the Week widget.
///
/// Using this style, you can add styling to your Day of the week widget.
///
/// The currently available style are: padding, margin, backgroundStyle, textStyle, textAlgin

class DayOfWeekHeaderStyle {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Decoration backgroundStyle;
  final TextStyle textStyle;
  final TextAlign textAlgin;
  const DayOfWeekHeaderStyle({
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.margin = EdgeInsets.zero,
    this.backgroundStyle = const BoxDecoration(),
    this.textAlgin = TextAlign.center,
  });
}
