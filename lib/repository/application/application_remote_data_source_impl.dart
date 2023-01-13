import 'package:dartz/dartz.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/core/error/errors_failure.dart';
import 'package:formsflowai/presentation/features/taskdetails/model/application_history_data_model.dart';

import '../../core/api/client/application/formsflowai_application_api_client.dart';
import '../../core/api/response/form/roles/formio_roles_response.dart';
import '../../core/database/entity/application_history_entity.dart';
import '../../core/preferences/app_preference.dart';
import 'application_repository.dart';

class ApplicationRemoteDataSourceImpl implements ApplicationHistoryRepository {
  final FormsFlowAIApplicationApiClient applicationApiClient;
  final AppPreferences appPreferences;
  final FlutterAppAuth flutterAppAuth;

  ApplicationRemoteDataSourceImpl(
      {required this.applicationApiClient,
      required this.appPreferences,
      required this.flutterAppAuth});

  /// Method to fetch application history from remote
  /// Parameters
  /// [ApplicationId]
  /// ---> Returns List[ApplicationHistoryDM]
  @override
  Future<Either<Failure, List<ApplicationHistoryDM>>> fetchApplicationHistory(
      {required int applicationId}) async {
    try {
      var response =
          await applicationApiClient.fetchApplicationHistory(applicationId);

      return Right(
          ApplicationHistoryDM.transform(applicationHistoryResponse: response));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ApplicationHistoryEntity?>>>
      fetchApplicationHistoryFromDb({required int applicationId}) {
    // TODO: implement fetchApplicationHistoryFromDb
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> insertAllApplicationHistory(
      {required List<ApplicationHistoryEntity> applicationEntityList}) {
    // TODO: implement insertAllApplicationHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FormioRolesResponse>> fetchFormioRoles() async {
    try {
      var response = await applicationApiClient.getFormioRoles();

      if (response.form != null) {
        return Right(response);
      }
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
