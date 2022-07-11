import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/user/user_data_repository.dart';
import 'package:formsflowai_api/response/user/login/keycloak_login_response.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';

/// [LoginUserCase] to login user
/// interacts with [UserDataRepository] to complete the operation
/// [LoginParams]
/// ---> Returns[KeyCloakLoginResponse]
class LoginUserCase implements UseCase<KeyCloakLoginResponse, LoginParams> {
  const LoginUserCase({required this.repository});

  final UserDataRepository repository;

  @override
  Future<Either<Failure, KeyCloakLoginResponse>> call({
    required LoginParams params,
  }) {
    return repository.loginUser(loginParams: params);
  }
}

class LoginParams extends Equatable {
  final String userName;
  final String password;

  const LoginParams({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}
