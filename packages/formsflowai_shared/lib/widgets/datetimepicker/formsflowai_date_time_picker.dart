import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormsflowAIDateTimePicker {
  /// Function to open Date Time Picker
  static Future<DateTime?>? buildDateTimePicker(
      {required BuildContext context}) async {
    // final ThemeData theme = Theme.of(context);
    // switch (theme.platform) {
    //   case TargetPlatform.android:
    //   case TargetPlatform.fuchsia:
    //   case TargetPlatform.linux:
    //   case TargetPlatform.windows:
    //     return _buildMaterialDatePicker(context: context);
    //   case TargetPlatform.iOS:
    //   case TargetPlatform.macOS:
    //     return _buildMaterialDatePicker(context: context);
    // }
    return _buildMaterialDatePicker(context: context);
  }

  /// Function to build material date and time picker in Android
  static Future<DateTime?>? _buildMaterialDatePicker(
      {required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(data: ThemeData.light(), child: child!);
      },
    );
    // Check if data is picked then open time picker
    if (picked != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 0, minute: 0),
          builder: (context, childWidget) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: childWidget!);
          });
      if (selectedTime != null) {
        var convertedDateTime = picked.add(Duration(
            hours: selectedTime.hour,
            minutes: selectedTime.minute,
            seconds: 00));

        return convertedDateTime;
      }
    } else {
      var convertedDateTime =
          picked?.add(const Duration(hours: 00, minutes: 00, seconds: 00));
      return convertedDateTime;
    }
    return null;
  }

  /// This builds cupertino date picker in iOS
  static Future<DateTime?>? _buildCupertinoDatePicker(
      {required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null) {
                  _buildCupertinoTimePicker(
                      context: context, selectedDate: picked);
                }
              },
              initialDateTime: DateTime.now(),
              minimumYear: DateTime.now().year,
              maximumYear: DateTime.now().add(const Duration(days: 365)).year,
            ),
          );
        });
    return null;
  }

  /// This builds cupertino time picker in iOS
  static Future<DateTime?>? _buildCupertinoTimePicker(
      {required BuildContext context, required DateTime selectedDate}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              onTimerDurationChanged: (Duration value) {
                ;
              },
            ),
          );
        });
    return null;
  }
}
