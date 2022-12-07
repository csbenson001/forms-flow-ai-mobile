import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:formsflowai/repository/application/application_local_data_source_impl.dart';
import 'package:formsflowai/repository/application/application_remote_data_source_impl.dart';
import 'package:formsflowai/repository/form/form_data_repository.dart';
import 'package:formsflowai/repository/form/form_local_data_source_impl.dart';
import 'package:formsflowai/repository/form/form_remote_data_source_impl.dart';
import 'package:formsflowai/repository/task/task_data_repository.dart';
import 'package:formsflowai/repository/task/task_local_data_source_impl.dart';
import 'package:formsflowai/repository/task/task_remote_data_source_impl.dart';
import 'package:formsflowai_api/client/application/application_api_client.dart';
import 'package:formsflowai_api/client/form/forms_api_client.dart';
import 'package:formsflowai_api/client/task/task_api_client.dart';
import 'package:formsflowai_api/client/user/user_api_client.dart';
import 'package:formsflowai_api/utils/dio_di.dart';
import 'package:isolated_http_client/isolated_http_client.dart';

import '../../repository/application/application_data_repository.dart';
import '../../repository/user/user_data_repository.dart';
import '../../repository/user/user_local_data_source_impl.dart';
import '../../repository/user/user_remote_data_source_impl.dart';
import '../networkmanager/network_manager_controller.dart';
import 'injection.dart';

/// Function to register repository and dats sources
Future<void> registerRepository() async {
  /// Register Network Manager Controller
  dl.registerLazySingleton(() => NetworkManagerController());

  /// Register User data sources and API client
  dl.registerLazySingleton(() => UserApiClient(getDio()));
  dl.registerLazySingleton(() => UserLocalDataSourceImpl(appPreferences: dl()));
  dl.registerLazySingleton(() => UserRemoteDataSourceImpl(
      userApiClient: dl(), flutterAppAuth: FlutterAppAuth()));
  dl.registerLazySingleton(
      () => UserDataRepository(remoteDataSource: dl(), localDataSource: dl()));

  // Register Task data sources and client
  dl.registerLazySingleton(() => TaskApiClient(getDio()));
  dl.registerLazySingleton(() => TaskRemoteDataSourceImpl(
      taskApiClient: dl(),
      appPreferences: dl(),
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
  dl.registerLazySingleton(() => FormsApiClient(getDio()));
  dl.registerLazySingleton(
      () => FormLocalDataSource(taskDao: dl(), formsDao: dl()));
  dl.registerLazySingleton(() => FormRemoteDataSource(
      formsApiClient: dl(), appPreferences: dl(), isolatedHttpClient: dl()));
  dl.registerLazySingleton(() => FormDataRepository(
      remoteDataSource: dl(),
      localDataSource: dl(),
      networkManagerController: dl()));

  // Register Application data sources and client
  dl.registerLazySingleton(() => ApplicationApiClient(getDio()));
  dl.registerLazySingleton(() => ApplicationRemoteDataSourceImpl(
      userApiClient: dl(), appPreferences: dl(), applicationApiClient: dl()));

  dl.registerLazySingleton(() => ApplicationLocalDataSourceImpl(
      appPreferences: dl(), applicationHistoryDao: dl()));

  dl.registerLazySingleton(() => ApplicationHistoryDataRepository(
      networkManagerController: dl(),
      localDataSource: dl(),
      remoteDataSource: dl()));

  // Register Isolated Http Client for background API Calls
  dl.registerLazySingleton(() => HttpClient(
      log: false,
      timeout: const Duration(
        seconds: 10,
      )));
}
