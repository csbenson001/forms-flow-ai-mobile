import 'dart:core';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'env_key_constants.dart';

class FormsFlowAIConstants {
  //Environment File

  static const envFileName = 'sample.env';
  static final clientId = dotenv.get(EnvKeyConstants.envKeycloakWebClientId);
  static const keycloakScopes = ['openid', 'profile', 'offline_access'];
  static final keycloakRedirectUrl =
      dotenv.get(EnvKeyConstants.envKeycloakRedirectUrl);
  static const tokenGrantTypePassword = 'password';
  static const tokenGrantTypeRefreshToken = 'refresh_token';
  static final webSocketEncryptKey =
      dotenv.get(EnvKeyConstants.envWebsocketEncryptKey);

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
  static const String formsFlowAiForm = "form";

  // Other constants
  static const int noPosition = -1;
}

enum ViewState { initial, success, failure, noData, loading }

enum TaskDetailsDateSelectorType { dueDate, followupDate, none }
