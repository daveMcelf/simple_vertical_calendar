library simple_vertical_calendar.src.header;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_vertical_calendar/src/constant.dart';
import 'package:simple_vertical_calendar/src/customization/header_style.dart';

/// [HeaderWidget] is the widget for building Month Header section of the calendar.
class HeaderWidget extends StatelessWidget {
  ///Display text for this widget
  final DateTime thisHeaderDate;

  ///Styling specify by user
  final HeaderStyle? headerStyle;
  const HeaderWidget(
    this.thisHeaderDate, {
    this.headerStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: headerStyle?.backgroundStyle,
      child: Text(
        DateFormat(monthFormat[headerStyle?.monthFormat])
            .format(thisHeaderDate),
        style: headerStyle?.titleTextStyle,
        textAlign: headerStyle?.textAlgin,
      ),
    );
  }
}
