library vertical_calendar.src.customization.header_style;

import 'package:flutter/material.dart';
import 'package:vertical_calendar/src/constant.dart';

class HeaderStyle {
  final TextStyle titleTextStyle;
  final MonthFormats monthFormat;
  final Decoration backgroundStyle;
  final TextAlign textAlgin;
  const HeaderStyle({
    this.titleTextStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w800,
    ),
    this.monthFormat = MonthFormats.FULL,
    this.backgroundStyle,
    this.textAlgin = TextAlign.center,
  });
}
