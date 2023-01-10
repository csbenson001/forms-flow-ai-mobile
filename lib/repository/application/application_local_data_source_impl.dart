import 'package:dartz/dartz.dart';
import 'package:formsflowai/core/api/response/form/roles/formio_roles_response.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/application_history_data_model.dart';
import 'package:formsflowai/repository/application/application_repository.dart';

import '../../core/database/dao/application_history_dao.dart';
import '../../core/database/entity/application_history_entity.dart';
import '../../core/preferences/app_preference.dart';

class ApplicationLocalDataSourceImpl implements ApplicationHistoryRepository {
  final AppPreferences appPreferences;

  final ApplicationHistoryDao applicationHistoryDao;

  ApplicationLocalDataSourceImpl(
      {required this.appPreferences, required this.applicationHistoryDao});

  /// Method to fetch application history data model from local data source
  /// Parameters
  /// [ApplicationId]
  /// ---> Returns List[ApplicationHistoryDM]
  @override
  Future<Either<Failure, List<ApplicationHistoryDM>>> fetchApplicationHistory(
      {required int applicationId}) async {
    var response =
        await applicationHistoryDao.findHistoryByApplicationId(applicationId);
    return Right(ApplicationHistoryDM.transformFromEntity(
        applicationHistorys: response));
  }

  /// Method to fetch application history entity from local data source
  /// Parameters
  /// [ApplicationId]
  /// ---> Returns List[ApplicationHistoryEntity]
  @override
  Future<Either<Failure, List<ApplicationHistoryEntity?>>>
      fetchApplicationHistoryFromDb({required int applicationId}) async {
    return Right(
        await applicationHistoryDao.findHistoryByApplicationId(applicationId));
  }

  /// Method to insert application history entity into local data source
  /// Parameters
  /// List[ApplicationHistoryEntity]
  @override
  Future<Either<Failure, void>> insertAllApplicationHistory(
      {required List<ApplicationHistoryEntity> applicationEntityList}) async {
    return Right(await applicationHistoryDao
        .insertApplicationHistorys(applicationEntityList));
  }

  @override
  Future<Either<Failure, FormioRolesResponse>> fetchFormioRoles() async {
    if (appPreferences.getFormioRoleResponse() != null) {
      return Right(appPreferences.getFormioRoleResponse()!);
    }
    return Left(ServerFailure());
  }
}
