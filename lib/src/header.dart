library simple_vertical_calendar.src.header;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_vertical_calendar/src/constant.dart';
import 'package:simple_vertical_calendar/src/customization/header_style.dart';

class HeaderWidget extends StatelessWidget {
  final DateTime thisHeaderDate;
  final HeaderStyle headerStyle;
  const HeaderWidget(
    this.thisHeaderDate, {
    this.headerStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: headerStyle.backgroundStyle,
      child: Text(
        DateFormat(monthFormat[headerStyle.monthFormat]).format(thisHeaderDate),
        style: headerStyle.titleTextStyle,
        textAlign: headerStyle.textAlgin,
      ),
    );
  }
}
