import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/user/user_data_repository.dart';

/// [RefreshKeyCloakTokenUserCase] to login user using the authenticator
/// method interacts with [UserDataRepository] to complete the operation
/// [RefreshKeycloakTokenParams]
/// ---> Returns[TokenResponse]
class RefreshKeyCloakTokenUserCase
    implements UseCase<TokenResponse, RefreshKeycloakTokenParams> {
  const RefreshKeyCloakTokenUserCase({required this.repository});

  final UserDataRepository repository;

  @override
  Future<Either<Failure, TokenResponse>> call({
    required RefreshKeycloakTokenParams params,
  }) {
    return repository.refreshKeycloakToken(params: params);
  }
}

class RefreshKeycloakTokenParams extends Equatable {
  final String clientId;
  final String redirectUrl;
  final List<String> scopes;
  final String refreshOfflineToken;

  const RefreshKeycloakTokenParams(
      {required this.clientId,
      required this.redirectUrl,
      required this.refreshOfflineToken,
      required this.scopes});

  @override
  List<Object?> get props => [clientId, redirectUrl, scopes];
}
