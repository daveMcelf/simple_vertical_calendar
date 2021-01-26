library simple_vertical_calendar.src.constant;

/// [MonthFormats] can be used to format your month header.
///
/// current support format are: `FULL`, `SHORT`, `MONTH_ONLY`.
enum MonthFormats { FULL, SHORT, MONTH_ONLY }

final monthFormat = const {
  MonthFormats.FULL: 'MMMM y',
  MonthFormats.SHORT: 'MMM y',
  MonthFormats.MONTH_ONLY: 'MMMM',
};
