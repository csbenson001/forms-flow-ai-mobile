import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import '../../../../../../core/error/errors_failure.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../repository/user/user_data_repository.dart';

/// [LogoutKeycloakAuthenticatorUserCase] to logout user using the authenticator
/// method interacts with [UserDataRepository] to complete the operation
/// [LogoutKeycloakAuthenticatorParams]
/// ---> Returns[ EndSessionResponse]
class LogoutKeycloakAuthenticatorUserCase
    implements UseCase<EndSessionResponse, LogoutKeycloakAuthenticatorParams> {
  const LogoutKeycloakAuthenticatorUserCase({required this.repository});

  final UserDataRepository repository;

  @override
  Future<Either<Failure, EndSessionResponse>> call({
    required LogoutKeycloakAuthenticatorParams params,
  }) {
    return repository.logoutKeycloak();
  }
}

class LogoutKeycloakAuthenticatorParams extends Equatable {
  const LogoutKeycloakAuthenticatorParams();

  @override
  List<Object?> get props => [];
}
