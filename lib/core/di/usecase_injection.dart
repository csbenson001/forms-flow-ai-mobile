import 'package:formsflowai/presentation/features/taskdetails/usecases/save_form_submission_isolate_usecase.dart';
import 'package:formsflowai/presentation/features/taskdetails/usecases/save_form_submission_usecase.dart';
import 'package:formsflowai/presentation/features/taskdetails/usecases/submit_form_isolate_usecase.dart';
import 'package:formsflowai/presentation/features/taskdetails/usecases/submit_form_usecase.dart';

import '../../presentation/features/home/tasklisting/usecases/index.dart';
import '../../presentation/features/login/usecases/index.dart';
import '../../presentation/features/login/usecases/login_user_usecase.dart';
import '../../presentation/features/taskdetails/usecases/index.dart';
import '../database/worker/database_worker.dart';
import 'injection.dart';

Future<void> registerUseCases() async {
  /// ------------------ USER USECASES ------------------ ///
  /// Remote
  dl.registerLazySingleton(() => LoginUserCase(repository: dl()));
  dl.registerLazySingleton(() => FetchUserInfoUseCase(repository: dl()));

  /// Local
  dl.registerLazySingleton(() => SaveUserDetailsUseCase(repository: dl()));

  /// ------------------ TASK USECASES ------------------ ///
  // Local
  dl.registerLazySingleton(() => InsertAllTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => InsertLocalTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => UpdateLocalTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => DeleteLocalTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => FetchLocalAllTasksUseCase(repository: dl()));
  dl.registerLazySingleton(() => FetchLocalTaskUseCase(repository: dl()));

  // Remote
  dl.registerLazySingleton(
      () => FetchProcessDefinitionUseCase(repository: dl()));
  dl.registerLazySingleton(() => FetchFiltersUseCase(repository: dl()));
  dl.registerLazySingleton(
      () => FetchIsolatedTaskVariablesUseCase(repository: dl()));
  dl.registerLazySingleton(
      () => FetchIsolatedFormDataUseCase(repository: dl()));
  dl.registerLazySingleton(
      () => FetchIsolatedFormSubmissionDataUseCase(repository: dl()));
  dl.registerLazySingleton(() => FetchTasksUseCase(repository: dl()));
  dl.registerLazySingleton(() => FetchTaskCountUseCase(repository: dl()));
  dl.registerLazySingleton(() => FetchTaskVariablesUseCase(repository: dl()));
  dl.registerLazySingleton(() => FetchIsolatedTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => UpdateIsolatedTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => UpdateRemoteTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => ListTaskGroupsUseCase(repository: dl()));
  dl.registerLazySingleton(() => AddGroupsUseCase(repository: dl()));
  dl.registerLazySingleton(() => DeleteGroupsUseCase(repository: dl()));
  dl.registerLazySingleton(() => UpdateAssigneeUseCase(repository: dl()));
  dl.registerLazySingleton(() => ClaimTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => UnClaimTaskUseCase(repository: dl()));
  dl.registerLazySingleton(() => ListMembersUseCase(repository: dl()));

  /// ------------------ FORM USECASES ------------------ ///

  /// local
  dl.registerLazySingleton(() => FetchFormEntityUseCase(repository: dl()));
  dl.registerLazySingleton(() => InsertFormDataUseCase(repository: dl()));
  dl.registerLazySingleton(() => FetchFormUseCase(repository: dl()));

  /// Remote
  dl.registerLazySingleton(() => FetchFormSubmissionUseCase(repository: dl()));
  dl.registerLazySingleton(() => SubmitFormUseCase(repository: dl()));
  dl.registerLazySingleton(() => SaveFormSubmissionUseCase(repository: dl()));
  dl.registerLazySingleton(
      () => SaveFormSubmissionIsolateUseCase(repository: dl()));
  dl.registerLazySingleton(() => SubmitFormIsolateUseCase(repository: dl()));

  /// ------------------ APPLICATION HISTORY USECASES ------------------ ///

  // local data source useCases
  dl.registerLazySingleton(
      () => FetchApplicationHistoryEntityUseCase(repository: dl()));
  dl.registerLazySingleton(
      () => InsertLocalApplicationHistoryUseCase(repository: dl()));

  /// Remote data source useCases
  dl.registerLazySingleton(
      () => FetchApplicationHistoryUseCase(repository: dl()));
  dl.registerLazySingleton(() => ClearLocalDatabaseUseCase(repository: dl()));

  /// Database Worker
  dl.registerSingleton(DatabaseWorker(
      insertAllTaskUseCase: dl(),
      fetchLocalAllTasksUseCase: dl(),
      fetchFormEntityUseCase: dl(),
      networkManagerController: dl(),
      insertLocalTaskUseCase: dl(),
      fetchIsolatedFormDataUseCase: dl(),
      fetchIsolatedFormSubmissionDataUseCase: dl(),
      insertFormDataUseCase: dl(),
      deleteLocalTaskUseCase: dl(),
      fetchIsolatedTaskUseCase: dl(),
      updateIsolatedTaskUseCase: dl(),
      updateLocalTaskUseCase: dl(),
      fetchLocalTaskUseCase: dl(),
      appPreferences: dl(),
      saveFormSubmissionIsolateUseCase: dl(),
      submitFormIsolateUseCase: dl(),
      fetchIsolatedTaskVariablesUseCase: dl()));
}
