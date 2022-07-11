import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:intl/intl.dart';

class TimeStampUtils {
  static String convertDateToString(DateTime date) {
    final sFormatter = DateFormat(FormsFlowAIConstants.dateYearFormat);
    return sFormatter.format(date);
  }

  static String convertDateToStringWithFormat(DateTime date, String toformat) {
    final sFormatter = DateFormat(toformat);
    return sFormatter.format(date);
  }

  static String convertStringDateTimeWithFormat(
      String date, String fromFormat, String toFormat) {
    final toFormatter = DateFormat(toFormat);
    final date1 = convertStringToDateWithFormat(date, fromFormat);
    return toFormatter.format(date1);
  }

  static DateTime convertStringToDate(String date) {
    final sFormatter = DateFormat(FormsFlowAIConstants.dateYearFormat);
    return sFormatter.parse(date);
  }

  static DateTime convertStringToDateWithFormat(String date, String format) {
    final sFormatter = DateFormat(format);
    return sFormatter.parse(date);
  }

  static String? formatISOTime(DateTime? date) {
    final duration = date?.timeZoneOffset;
    if (date != null && duration != null && duration.isNegative) {
      return (date.toIso8601String().replaceAll("Z", "").trim() +
          "-${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    } else if (date != null && duration != null) {
      return (date.toIso8601String().replaceAll("Z", "").trim() +
          "+${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    } else {
      return null;
    }
  }
}
