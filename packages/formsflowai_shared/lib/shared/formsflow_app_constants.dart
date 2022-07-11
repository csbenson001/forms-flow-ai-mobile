import 'dart:core';

class FormsFlowAIConstants {
  //Environment File

  static const env_File_Name = '.env';
  static const CLIENT_ID = 'forms-flow-mobile';
  static const CLIENT_SECRET_KEY = 'e4bdbd25-1467-4f7f-b993-bc4b1944c943';
  static const TOKEN_GRANT_TYPE_PASSWORD = 'password';
  static const TOKEN_GRANT_TYPE_REFRESH_TOKEN = 'refresh_token';

  /// Date Formatters
  static const dateYearFormat = 'yyyy-MM-dd';
  static const dateYearTimeStampTFormat = 'yyyy-MM-ddTHH:mm:ssZ';
  static const dateYearTimeStamp = 'yyyy-MM-dd HH:mm:ssZ';
  static const dateYearTimeStampDateFormat = 'dd-MMM-yyyy hh:mm aa';

  /// Splash Loading Timer
  static const int splashTimerSeconds = 3;

  /// Progress Loading
  static const int loadingDisplayDurationSeconds = 2000;

  // Form keyword
  static const String FORMSFLOWAI_FORM = "form";

  // Other constants
  static const int NO_POSITION = -1;
}

enum ViewState { initial, success, failure, noData, loading }

enum TaskDetailsDateSelectorType { dueDate, followupDate, none }
