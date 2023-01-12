import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/core/dio/dio_di.dart';
import 'package:formsflowai/repository/application/application_local_data_source_impl.dart';
import 'package:formsflowai/repository/application/application_remote_data_source_impl.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:formsflowai/repository/form/form_local_data_source_impl.dart';
import 'package:formsflowai/repository/form/form_remote_data_source_impl.dart';
import 'package:formsflowai/repository/task/task_data_repository.dart';
import 'package:formsflowai/repository/task/task_local_data_source_impl.dart';
import 'package:formsflowai/repository/task/task_remote_data_source_impl.dart';
import 'package:isolated_http_client/isolated_http_client.dart';

import '../../repository/application/application_data_repository.dart';
import '../../repository/user/user_data_repository.dart';
import '../../repository/user/user_local_data_source_impl.dart';
import '../../repository/user/user_remote_data_source_impl.dart';
import '../api/client/application/formsflowai_application_api_client.dart';
import '../api/client/form/forms_api_client.dart';
import '../api/client/task/bpm_task_api_client.dart';
import '../api/client/user/user_api_client.dart';
import '../networkmanager/network_manager_controller.dart';
import 'injection.dart';

/// Function to register repository and dats sources
Future<void> registerRepository() async {
  /// Register Network Manager Controller
  dl.registerLazySingleton(() => NetworkManagerController());

  dl.registerLazySingleton(() => const FlutterAppAuth());

  /// Register User data sources and API client
  dl.registerLazySingleton(() => UserApiClient(dl<DioHelper>().getUserDio()));
  dl.registerLazySingleton(() => UserLocalDataSourceImpl(appPreferences: dl()));
  dl.registerLazySingleton(() =>
      UserRemoteDataSourceImpl(userApiClient: dl(), flutterAppAuth: dl()));
  dl.registerLazySingleton(
      () => UserDataRepository(remoteDataSource: dl(), localDataSource: dl()));

  // Register Task data sources and client
  dl.registerLazySingleton(
      () => BpmTaskApiClient(dl<DioHelper>().getTaskDio()));
  dl.registerLazySingleton(() => TaskRemoteDataSourceImpl(
      flutterAppAuth: dl(),
      taskApiClient: dl(),
      appPreferences: dl(),
      taskDio: dl<DioHelper>().getTaskDio(),
      isolatedHttpClient: dl(),
      userApiClient: dl()));
  dl.registerLazySingleton(() => TaskLocalDataSourceImpl(
      preferences: dl(),
      applicationHistoryDao: dl(),
      formsFlowDatabase: dl(),
      taskDao: dl()));
  dl.registerLazySingleton(() => TaskDataRepository(
      remoteDataSource: dl(),
      localDataSource: dl(),
      networkManagerController: dl()));

  // Register Form data source and client
  dl.registerLazySingleton(() => FormsApiClient(dl<DioHelper>().getFormDio()));
  dl.registerLazySingleton(() => FormLocalDataSource(
      formsFlowDatabase: dl(), taskDao: dl(), formsDao: dl()));
  dl.registerLazySingleton(() => FormRemoteDataSource(
      formDio: dl<DioHelper>().getFormDio(),
      formsApiClient: dl(),
      appPreferences: dl(),
      isolatedHttpClient: dl()));
  dl.registerLazySingleton(() => FormDataRepository(
      remoteDataSource: dl(),
      localDataSource: dl(),
      networkManagerController: dl()));

  // Register Application data sources and client
  dl.registerLazySingleton(() =>
      FormsFlowAIApplicationApiClient(dl<DioHelper>().getApplicationDio()));
  dl.registerLazySingleton(() => ApplicationRemoteDataSourceImpl(
      flutterAppAuth: dl(), appPreferences: dl(), applicationApiClient: dl()));

  dl.registerLazySingleton(() => ApplicationLocalDataSourceImpl(
      appPreferences: dl(), applicationHistoryDao: dl()));

  dl.registerLazySingleton(() => ApplicationHistoryDataRepository(
      networkManagerController: dl(),
      localDataSource: dl(),
      remoteDataSource: dl()));

  // Register Isolated Http Client for background API Calls
  dl.registerLazySingleton(() => HttpClientIsolated(
      log: false,
      timeout: const Duration(
        seconds: 15,
      )));
}
