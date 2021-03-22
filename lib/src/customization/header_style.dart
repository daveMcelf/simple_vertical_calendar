library simple_vertical_calendar.src.customization.header_style;

import 'package:flutter/material.dart';
import 'package:simple_vertical_calendar/src/constant.dart';

/// [HeaderStyle] is the styling class for each month header of the widget.
///
/// Using this style, you can add styling to your Month header widget.
/// This class also give different text format to your Month header by using [MonthFormats].
///
/// The currently available style are: titleTextStyle, monthFormat, backgroundStyle, textAlgin

class HeaderStyle {
  final TextStyle titleTextStyle;
  final MonthFormats monthFormat;
  final Decoration? backgroundStyle;
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
