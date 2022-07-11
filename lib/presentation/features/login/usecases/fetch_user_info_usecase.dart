import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai/repository/user/user_data_repository.dart';
import 'package:formsflowai_api/response/user/info/user_info_response.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';

/// [FetchUserInfoUseCase] to fetch user info from remote
/// interacts with [UserDataRepository] to complete the operation
/// [FetchUserInfoParams]
/// ---> Returns[UserInfoResponse]
class FetchUserInfoUseCase
    implements UseCase<UserInfoResponse, FetchUserInfoParams> {
  const FetchUserInfoUseCase({required this.repository});

  final UserDataRepository repository;

  @override
  Future<Either<Failure, UserInfoResponse>> call(
      {required FetchUserInfoParams params}) {
    return repository.userInfo(fetchUserInfoParams: params);
  }
}

class FetchUserInfoParams extends Equatable {
  final String accessToken;

  const FetchUserInfoParams({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
