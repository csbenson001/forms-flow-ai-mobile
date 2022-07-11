import 'package:dartz/dartz.dart';

import '../error/errors_failure.dart';

/// [UseCase] base useCase to interact with local/remote data source
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}
