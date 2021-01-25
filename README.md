# vertical_calendar

This package contain widget for building a Vertical Scroll Calendar widget that is similar to the one use in AirBnB.
This widget is design to be highly customizable. You can change any section of the widget to your like.

## installing

add this library to your `pubspec.yaml`
```
vertical_calendar: ^0.0.1
```

Using this widget,
```
VerticalCalendar(
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
        textColor: Colors.green, 
        unavailableTextColor: Colors.pink,
    ),
    onDateTap: (start, end) {
        print(start);
        print(end);
    },
),

```
