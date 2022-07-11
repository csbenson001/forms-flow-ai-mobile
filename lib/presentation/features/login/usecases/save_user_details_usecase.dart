import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formsflowai_api/response/user/info/user_info_response.dart';

import '../../../../core/error/errors_failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../repository/user/user_data_repository.dart';

/// [SaveUserDetailsUseCase] to save user details in preferences
/// interacts with [UserDataRepository] to complete the operation
/// [SaveUserDetailsParams]
class SaveUserDetailsUseCase implements UseCase<void, SaveUserDetailsParams> {
  const SaveUserDetailsUseCase({required this.repository});

  final UserDataRepository repository;

  @override
  Future<Either<Failure, void>> call({required SaveUserDetailsParams params}) {
    return repository.saveUserDetails(params: params);
  }
}

class SaveUserDetailsParams extends Equatable {
  final UserInfoResponse userInfoResponse;
  final String accessToken;
  final String refreshToken;

  const SaveUserDetailsParams(
      {required this.userInfoResponse,
      required this.accessToken,
      required this.refreshToken});

  @override
  List<Object?> get props => [userInfoResponse, accessToken, refreshToken];
}
