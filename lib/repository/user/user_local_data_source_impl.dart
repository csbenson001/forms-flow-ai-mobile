import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:formsflowai/repository/user/user_local_data_source.dart';
import 'package:formsflowai_api/response/user/info/user_info_response.dart';
import 'package:formsflowai_shared/core/preferences/app_preference.dart';

import '../../core/error/errors_failure.dart';
import '../../presentation/features/login/usecases/save_user_details_usecase.dart';
import '../../utils/general_util.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final AppPreferences appPreferences;

  UserLocalDataSourceImpl({required this.appPreferences});

  /// Method to save user details
  /// Parameters
  /// [SaveUserDetailsParams]
  @override
  Future<Either<Failure, void>> saveUserDetails(
      {required SaveUserDetailsParams params}) async {
    // Set User info and token values into the shared preferences
    appPreferences.setAccessToken(params.accessToken);
    appPreferences.setRefreshToken(params.refreshToken);
    appPreferences.setUserLoggedIn(true);
    appPreferences.setUserName(params.userInfoResponse.name ?? '');
    appPreferences
        .setPreferredUserName(params.userInfoResponse.preferredUsername ?? '');
    appPreferences.setGroups(params.userInfoResponse.groups ?? []);
    appPreferences.setRoles(params.userInfoResponse.role ?? []);
    appPreferences.setUserRole(
        GeneralUtil.getUserRole(params.userInfoResponse.role ?? []));
    UserInfoResponse userInfoResponse = params.userInfoResponse;
    appPreferences.setUserInfo(json.encode(userInfoResponse));
    appPreferences.setUserImage(
        "https://img.icons8.com/fluency/344/user-male-circle.png");
    return const Right(true);
  }
}
