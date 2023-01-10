import 'package:dartz/dartz.dart';

import '../../core/api/response/form/roles/formio_roles_response.dart';
import '../../core/database/entity/application_history_entity.dart';
import '../../core/error/errors_failure.dart';
import '../../presentation/features/taskdetails/model/application_history_data_model.dart';

abstract class ApplicationHistoryRepository<T> {
  Future<Either<Failure, List<ApplicationHistoryDM>>> fetchApplicationHistory(
      {required int applicationId});

  Future<Either<Failure, List<ApplicationHistoryEntity?>>>
      fetchApplicationHistoryFromDb({required int applicationId});

  Future<Either<Failure, void>> insertAllApplicationHistory(
      {required List<ApplicationHistoryEntity> applicationEntityList});

  Future<Either<Failure, FormioRolesResponse>> fetchFormioRoles();
}
