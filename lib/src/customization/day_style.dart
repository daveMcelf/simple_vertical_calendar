library vertical_calendar.src.customization.day_style;

import 'package:flutter/material.dart';

class DayHeaderStyle {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Decoration backgroundStyle;
  final TextStyle textStyle;
  final TextAlign textAlgin;
  const DayHeaderStyle({
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.margin = EdgeInsets.zero,
    this.backgroundStyle = const BoxDecoration(),
    this.textAlgin = TextAlign.center,
  });
}
