import 'package:dartz/dartz.dart';
import 'package:formsflowai/presentation/features/login/usecases/save_user_details_usecase.dart';

import '../../core/error/errors_failure.dart';

abstract class UserLocalDataSource<T> {
  Future<Either<Failure, bool>> saveUserDetails(
      {required SaveUserDetailsParams params});
}
