import 'package:floor/floor.dart';

class DateTimeNullableConverter extends TypeConverter<DateTime?, String?> {
  @override
  DateTime? decode(String? state) {
    if (state == null) {
      return null;
    }
    return DateTime.parse(state).toUtc();
  }

  @override
  String? encode(DateTime? value) {
    if (value == null) {
      return null;
    }
    return value.toUtc().toIso8601String();
  }
}