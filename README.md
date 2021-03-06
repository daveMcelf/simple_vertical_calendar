# simple_vertical_calendar

[![pub package](https://img.shields.io/pub/v/simple_vertical_calendar.svg?label=simple_vertical_calendar)](https://pub.dev/packages/simple_vertical_calendar)
[![likes](https://badges.bar/simple_vertical_calendar/likes)](https://pub.dev/packages/simple_vertical_calendar/score)

This package contain widget for building a Vertical Scroll Calendar widget that is similar to the one use in AirBnB.
This widget is design to be highly customizable. You can change any section of the widget to your like.
![](https://user-images.githubusercontent.com/13494582/105748644-c4aea100-5f85-11eb-825e-c4dda831d79a.jpg)

## installing

add this library to your `pubspec.yaml`
```
simple_vertical_calendar: ^1.1.0
```

Using this widget,
```
SimpleVerticalCalendar(
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
    calendarOption: CalendarOptions.RANGE_SELECTION, // [RANGE_SELECTION, SINGLE]
    dayOfWeekHeaderStyle: DayOfWeekHeaderStyle(),
    dayStyle: DayHeaderStyle(
        textColor: Colors.black,
        unavailableTextColor: Colors.pink,
    ),
    onDateTap: (start, end) {
        print(start);
        print(end);
    },
),

```
