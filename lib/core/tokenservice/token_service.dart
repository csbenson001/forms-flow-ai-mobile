import 'package:cron/cron.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/core/preferences/app_preference.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation/features/login/usecases/refresk_keycloak_token_usecase.dart';
import '../error/errors_failure.dart';

class TokenService {
  final AppPreferences appPreferences;
  final Cron cron;
  final Ref ref;
  bool serviceStarted = false;
  ScheduledTask? scheduledTask;
  final RefreshKeyCloakTokenUserCase refreshKeyCloakTokenUserCase;

  TokenService(
      {required this.appPreferences,
      required this.cron,
      required this.ref,
      required this.refreshKeyCloakTokenUserCase});

  Future<void> startService() async {
    print("Service Started");

    serviceStarted = true;

    // scheduledTask = cron.schedule(Schedule.parse('*/2 * * * *'), () async {
    //   print(DateTime.now());
    //   print('Service Runs every 2 minutes');
    //
    //   if (TokenUtils.isTokenExpired(token: appPreferences.getAccessToken())) {
    //     refreshKeycloakToken().then((value) {
    //       value.fold((l) {
    //       }, (TokenResponse r) {
    //         appPreferences.setAccessToken(
    //             r.accessToken ?? appPreferences.getAccessToken());
    //         appPreferences.setRefreshToken(
    //             r.refreshToken ?? appPreferences.getRefreshToken());
    //       });
    //     });
    //   }
    // });
  }

  void stopService() {
    print('Service Closed');
    scheduledTask?.cancel();
    cron.close().then((value) {
      serviceStarted = true;
    });
  }

  Future<Either<Failure, TokenResponse>> refreshKeycloakToken() {
    const String _clientId = FormsFlowAIConstants.CLIENT_ID;
    const String _redirectUrl = 'com.aot.formsflowai:/*';
    // final List<String> _scopes = <String>[
    //   'openid',
    //   'profile',
    //   'offline_access'
    // ];

    final List<String> _scopes = <String>[
      'openid',
      'profile',
    ];

    return refreshKeyCloakTokenUserCase.call(
        params: RefreshKeycloakTokenParams(
            clientId: _clientId,
            redirectUrl: _redirectUrl,
            refreshOfflineToken: appPreferences.getRefreshToken(),
            scopes: _scopes));
  }
}
