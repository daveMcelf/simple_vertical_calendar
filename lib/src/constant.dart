library vertical_calendar.src.constant;

enum MonthFormats { FULL, SHORT, MONTH_ONLY }

final monthFormat = const {
  MonthFormats.FULL: 'MMMM y',
  MonthFormats.SHORT: 'MMM y',
  MonthFormats.MONTH_ONLY: 'MMMM',
};
