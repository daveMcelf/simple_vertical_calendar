# simple_vertical_calendar

This package contain widget for building a Vertical Scroll Calendar widget that is similar to the one use in AirBnB.
This widget is design to be highly customizable. You can change any section of the widget to your like.
![](https://user-images.githubusercontent.com/13494582/105748644-c4aea100-5f85-11eb-825e-c4dda831d79a.jpg)

## installing

add this library to your `pubspec.yaml`
```
simple_vertical_calendar: ^0.0.1
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
