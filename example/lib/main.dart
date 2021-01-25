import 'package:flutter/material.dart';
import 'package:vertical_calendar/vertical_calendar.dart';

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
      body: Center(
        child: Container(
          child: VerticalCalendar(
            numOfMonth: 6,
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              textAlgin: TextAlign.left,
              monthFormat: MonthFormats.SHORT,
            ),
            dayOfWeekHeaderStyle: DayOfWeekHeaderStyle(),
            dayStyle: DayHeaderStyle(
                textColor: Colors.green, backgroundColor: Colors.teal),
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
