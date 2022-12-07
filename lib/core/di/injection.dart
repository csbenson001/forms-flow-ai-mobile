// service locator
import 'package:formsflowai/core/di/repo_injection.dart';
import 'package:formsflowai/core/di/usecase_injection.dart';
import 'package:formsflowai/utils/eventbus/formsflowai_eventbus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/formsflow_database.dart';
import '../preferences/app_preference.dart';
import '../socket/socket_service.dart';

// Injection locator
final dl = GetIt.instance;

Future<void> registerServices() async {
  /// Build FormsFlowAI database
  FormsFlowDatabase database = await $FloorFormsFlowDatabase
      .databaseBuilder(FormsFlowDatabase.DATABASE_NAME)
      .build();

  /// Register Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  dl.registerLazySingleton(() => sharedPreferences);
  dl.registerLazySingleton(() => AppPreferences(sharedPreferences));

  /// Register database dao
  dl.registerLazySingleton(() => database);
  dl.registerSingleton(database.applicationHistoryDao);
  dl.registerSingleton(database.formsFlowFormDao);
  dl.registerSingleton(database.taskDao);

  /// Register socket service
  dl.registerLazySingleton(() => SocketService(dl()));

  /// Register event bus
  dl.registerSingleton(() => FormsFlowEventBus());

  /// Inject Repository
  await registerRepository();

  /// Inject Usecases
  await registerUseCases();
}
