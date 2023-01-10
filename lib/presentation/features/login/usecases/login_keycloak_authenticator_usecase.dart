import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/user/user_data_repository.dart';

/// [LoginKeycloakAuthenticatorUserCase] to login user using the authenticator
/// method interacts with [UserDataRepository] to complete the operation
/// [LoginKeycloakAuthenticatorParams]
/// ---> Returns[AuthorizationTokenResponse]
class LoginKeycloakAuthenticatorUserCase
    implements
        UseCase<AuthorizationTokenResponse, LoginKeycloakAuthenticatorParams> {
  const LoginKeycloakAuthenticatorUserCase({required this.repository});

  final UserDataRepository repository;

  @override
  Future<Either<Failure, AuthorizationTokenResponse>> call({
    required LoginKeycloakAuthenticatorParams params,
  }) {
    return repository.loginUserUsingKeycloakAuthenticator(params: params);
  }
}

class LoginKeycloakAuthenticatorParams extends Equatable {
  const LoginKeycloakAuthenticatorParams();

  @override
  List<Object?> get props => [];
}
