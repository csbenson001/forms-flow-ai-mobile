import 'package:dartz/dartz.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';
import 'package:formsflowai/presentation/features/login/usecases/save_user_details_usecase.dart';
import 'package:formsflowai/repository/user/user_local_data_source.dart';
import 'package:formsflowai/repository/user/user_local_data_source_impl.dart';
import 'package:formsflowai/repository/user/user_remote_data_source.dart';
import 'package:formsflowai/repository/user/user_remote_data_source_impl.dart';
import 'package:formsflowai_api/response/user/info/user_info_response.dart';
import 'package:formsflowai_api/response/user/login/keycloak_login_response.dart';

import '../../presentation/features/login/usecases/login_user_usecase.dart';

class UserDataRepository implements UserRemoteDataSource, UserLocalDataSource {
  final UserRemoteDataSourceImpl remoteDataSource;
  final UserLocalDataSourceImpl localDataSource;

  UserDataRepository(
      {required this.localDataSource, required this.remoteDataSource});

  /// Method to login user
  /// Parameters
  /// [LoginParams]
  /// ---> Returns [KeyCloakLoginResponse]
  @override
  Future<Either<Failure, KeyCloakLoginResponse>> loginUser(
      {required LoginParams loginParams}) {
    return remoteDataSource.loginUser(loginParams: loginParams);
  }

  /// Method to save user details
  /// Parameters
  /// [SaveUserDetailsParams]
  @override
  Future<Either<Failure, void>> saveUserDetails(
      {required SaveUserDetailsParams params}) {
    return localDataSource.saveUserDetails(params: params);
  }

  /// Method to fetch User Info
  /// Parameters
  /// [FetchUserInfoParams]
  /// ---> Returns [UserInfoResponse]
  @override
  Future<Either<Failure, UserInfoResponse>> userInfo(
      {required FetchUserInfoParams fetchUserInfoParams}) {
    return remoteDataSource.userInfo(fetchUserInfoParams: fetchUserInfoParams);
  }
}
