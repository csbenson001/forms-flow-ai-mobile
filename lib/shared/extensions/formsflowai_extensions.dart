import 'dart:core';

import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:jiffy/jiffy.dart';

/// [DateTimeExtension] extension on datetime to get time from now
extension DateTimeExtension on DateTime {
  /// Method to get time difference between the currentTime and the
  /// provided time
  /// Input Parameters
  /// [Text]
  /// [DateTime]
  /// --> [Returns] String [TimeFromNow]
  String getTimeFromNow({required String text, required DateTime dateTime}) {
    return "$text${Jiffy(dateTime, FormsFlowAIConstants.dateYearTimeStampTFormat).fromNow()}";
  }
}

/// [ExtendedFlex] extension to to get child count
extension ExtendedFlex on Flex {
  int get childCount => children.length;
}

/// [StringExtension] extension methods to add string transformation
extension StringExtension on String {
  /// Method to parse string to integer
  int parseInt() {
    return int.parse(this);
  }

  /// Extension to concat application time
  String getApplicationTime({required String text, required String dateTime}) {
    return "$text ${Jiffy(dateTime, FormsFlowAIConstants.dateYearTimeStamp).format(FormsFlowAIConstants.dateYearTimeStampDateFormat)}";
  }
}
