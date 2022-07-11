import 'package:dartz/dartz.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/login/usecases/fetch_user_info_usecase.dart';
import 'package:formsflowai_api/response/user/info/user_info_response.dart';
import 'package:formsflowai_api/response/user/login/keycloak_login_response.dart';

import '../../presentation/features/login/usecases/login_user_usecase.dart';

abstract class UserRemoteDataSource<T> {
  Future<Either<Failure, KeyCloakLoginResponse>> loginUser(
      {required LoginParams loginParams});

  Future<Either<Failure, UserInfoResponse>> userInfo(
      {required FetchUserInfoParams fetchUserInfoParams});
}
