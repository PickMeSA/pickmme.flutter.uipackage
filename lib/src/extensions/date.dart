extension BooleanExtensions on DateTime {
  /// add years
  DateTime addYears({required int numberOfYears}) {
    return DateTime(year+numberOfYears, month, day);
  }
}