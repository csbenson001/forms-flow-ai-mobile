import 'package:floor/floor.dart';

class DateTimeNullableConverter extends TypeConverter<DateTime?, String?> {
  /// Function to decode string datetime into DateTime
  /// Input Parameters
  /// [DateTime] - String
  /// ---> Returns [DateTime]
  @override
  DateTime? decode(String? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return DateTime.parse(dateTime).toUtc();
  }

  /// Function to encode DateTime into DateTimeString
  /// Input Parameters
  /// [DateTime] - DateTime
  /// ---> Returns [DateTime] String
  @override
  String? encode(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return dateTime.toUtc().toIso8601String();
  }
}
