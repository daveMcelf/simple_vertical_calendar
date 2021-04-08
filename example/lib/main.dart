import 'package:flutter/material.dart';
import 'package:simple_vertical_calendar/simple_vertical_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: SimpleVerticalCalendar(
            numOfMonth: 6,
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlgin: TextAlign.left,
              monthFormat: MonthFormats.FULL,
            ),
            calendarOption: CalendarOptions.RANGE_SELECTION,
            dayOfWeekHeaderStyle: DayOfWeekHeaderStyle(),
            dayStyle: DayHeaderStyle(
              textColor: Colors.black,
            ),
            onDateTap: (start, end) {
              print(start);
              print(end);
            },
          ),
        ),
      ),
    );
  }
}
