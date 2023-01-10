import 'package:floor/floor.dart';

class DateTimeNullableConverter extends TypeConverter<DateTime?, String?> {
  @override
  DateTime? decode(String? databaseValue) {
    if (databaseValue == null) {
      return null;
    }
    return DateTime.parse(databaseValue).toUtc();
  }

  @override
  String? encode(DateTime? value) {
    if (value == null) {
      return null;
    }
    return value.toUtc().toIso8601String();
  }
}
