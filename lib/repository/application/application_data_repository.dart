import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/application_history_data_model.dart';
import 'package:formsflowai/repository/application/application_local_data_source_impl.dart';
import 'package:formsflowai/repository/application/application_remote_data_source_impl.dart';
import 'package:formsflowai/repository/application/application_repository.dart';
import 'package:formsflowai_shared/core/database/entity/application_history_entity.dart';
import 'package:formsflowai_shared/core/networkmanager/network_manager_controller.dart';

class ApplicationHistoryDataRepository implements ApplicationHistoryRepository {
  final ApplicationLocalDataSourceImpl localDataSource;

  final ApplicationRemoteDataSourceImpl remoteDataSource;

  final NetworkManagerController networkManagerController;

  ApplicationHistoryDataRepository(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkManagerController});

  /// Method to fetch application history
  /// Parameters
  /// [ApplicationId]
  /// ---> Returns List[ApplicationHistoryDM]
  @override
  Future<Either<Failure, List<ApplicationHistoryDM>>> fetchApplicationHistory(
      {required int applicationId}) {
    if (networkManagerController.connectionType != ConnectivityResult.none) {
      return remoteDataSource.fetchApplicationHistory(
          applicationId: applicationId);
    } else {
      return localDataSource.fetchApplicationHistory(
          applicationId: applicationId);
    }
  }

  /// Method to fetch application history from local source
  /// Parameters
  /// [ApplicationId]
  /// ---> Returns List[ApplicationHistoryEntity]
  @override
  Future<Either<Failure, List<ApplicationHistoryEntity?>>>
      fetchApplicationHistoryFromDb({required int applicationId}) {
    return localDataSource.fetchApplicationHistoryFromDb(
        applicationId: applicationId);
  }

  /// Method to insert application history into local source
  /// Parameters
  /// List[ApplicationHistoryEntity]
  @override
  Future<Either<Failure, void>> insertAllApplicationHistory(
      {required List<ApplicationHistoryEntity> applicationEntityList}) {
    return localDataSource.insertAllApplicationHistory(
        applicationEntityList: applicationEntityList);
  }
}
