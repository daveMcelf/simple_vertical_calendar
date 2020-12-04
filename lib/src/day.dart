library vertical_calendar.src.day;

import 'package:flutter/material.dart';
import 'package:vertical_calendar/src/customization/dayofweek_style.dart';

class DayWidget extends StatelessWidget {
  final String thisHeaderText;
  final DayOfWeekHeaderStyle dayOfWeekStyle;
  final bool isSelectedDate;
  final bool isFirstOrLast;
  const DayWidget(
    this.thisHeaderText, {
    this.dayOfWeekStyle,
    this.isSelectedDate,
    this.isFirstOrLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width - 70) / 7 - 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          isSelectedDate && isFirstOrLast
              ? Radius.circular((MediaQuery.of(context).size.width - 70) / 14)
              : Radius.circular(0),
        ),
        color:
            !isSelectedDate ? Colors.white : Color(0xFF007AFF).withOpacity(0.3),
      ),
    );
  }

  // BoxDecoration _buildBorder() {
  //   return BoxDecoration(
  //     borderRadius: BorderRadius.all(
  //       isSelectedDate && isFirstOrLast
  //           ? Radius.circular((MediaQuery.of(context).size.width - 70) / 14)
  //           : Radius.circular(0),
  //     ),
  //     color:
  //         !isSelectedDate ? Colors.white : Color(0xFF007AFF).withOpacity(0.3),
  //   );
  // }
}
