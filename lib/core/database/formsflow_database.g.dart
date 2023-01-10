// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formsflow_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFormsFlowDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FormsFlowDatabaseBuilder databaseBuilder(String name) =>
      _$FormsFlowDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FormsFlowDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FormsFlowDatabaseBuilder(null);
}

class _$FormsFlowDatabaseBuilder {
  _$FormsFlowDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FormsFlowDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FormsFlowDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FormsFlowDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FormsFlowDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FormsFlowDatabase extends FormsFlowDatabase {
  _$FormsFlowDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao? _taskDaoInstance;

  FormsFlowFormsDao? _formsFlowFormDaoInstance;

  ApplicationHistoryDao? _applicationHistoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task` (`id` INTEGER, `taskId` TEXT, `formResourceId` TEXT, `name` TEXT, `created` TEXT, `executionId` TEXT, `priority` INTEGER, `processDefinitionId` TEXT, `processInstanceId` TEXT, `taskDefinitionKey` TEXT, `processDefinitionName` TEXT, `suspended` INTEGER, `assignee` TEXT, `followUpDate` TEXT, `dueDate` TEXT, `status` TEXT, `filterId` TEXT, `applicationStatus` TEXT, `formUrl` TEXT, `applicationId` INTEGER, `submissionDate` TEXT, `submissionName` TEXT, `submissionId` TEXT, `formSubmissionData` TEXT, `isFormSubmissionDataUpdated` INTEGER, `isFormSubmissionDone` INTEGER, `isFormDataUpdated` INTEGER, `isTaskDataChanged` INTEGER, `formSubmissionActionType` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `formsflowform` (`id` INTEGER, `formResponse` TEXT, `formId` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `applicationhistory` (`id` INTEGER, `applicationId` INTEGER, `taskId` TEXT, `formId` TEXT, `formSubmissionId` TEXT, `formUrl` TEXT, `created` TEXT, `applicationStatus` TEXT, `submittedBy` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE UNIQUE INDEX `index_task_taskId` ON `task` (`taskId`)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_formsflowform_formId` ON `formsflowform` (`formId`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }

  @override
  FormsFlowFormsDao get formsFlowFormDao {
    return _formsFlowFormDaoInstance ??=
        _$FormsFlowFormsDao(database, changeListener);
  }

  @override
  ApplicationHistoryDao get applicationHistoryDao {
    return _applicationHistoryDaoInstance ??=
        _$ApplicationHistoryDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskEntityInsertionAdapter = InsertionAdapter(
            database,
            'task',
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'taskId': item.taskId,
                  'formResourceId': item.formResourceId,
                  'name': item.name,
                  'created': _dateTimeNullableConverter.encode(item.created),
                  'executionId': item.executionId,
                  'priority': item.priority,
                  'processDefinitionId': item.processDefinitionId,
                  'processInstanceId': item.processInstanceId,
                  'taskDefinitionKey': item.taskDefinitionKey,
                  'processDefinitionName': item.processDefinitionName,
                  'suspended':
                      item.suspended == null ? null : (item.suspended! ? 1 : 0),
                  'assignee': item.assignee,
                  'followUpDate':
                      _dateTimeNullableConverter.encode(item.followUp),
                  'dueDate': _dateTimeNullableConverter.encode(item.dueDate),
                  'status': item.status,
                  'filterId': item.filterId,
                  'applicationStatus': item.applicationStatus,
                  'formUrl': item.formUrl,
                  'applicationId': item.formApplicationId,
                  'submissionDate': item.formSubmissionDate,
                  'submissionName': item.formSubmissionName,
                  'submissionId': item.formSubmissionId,
                  'formSubmissionData': item.formSubmissionData,
                  'isFormSubmissionDataUpdated':
                      item.isFormSubmissionDataUpdated == null
                          ? null
                          : (item.isFormSubmissionDataUpdated! ? 1 : 0),
                  'isFormSubmissionDone': item.isFormSubmissionDone == null
                      ? null
                      : (item.isFormSubmissionDone! ? 1 : 0),
                  'isFormDataUpdated': item.isFormDataUpdated == null
                      ? null
                      : (item.isFormDataUpdated! ? 1 : 0),
                  'isTaskDataChanged': item.isTaskDataChanged == null
                      ? null
                      : (item.isTaskDataChanged! ? 1 : 0),
                  'formSubmissionActionType': item.formSubmissionActionType
                }),
        _taskEntityUpdateAdapter = UpdateAdapter(
            database,
            'task',
            ['id'],
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'taskId': item.taskId,
                  'formResourceId': item.formResourceId,
                  'name': item.name,
                  'created': _dateTimeNullableConverter.encode(item.created),
                  'executionId': item.executionId,
                  'priority': item.priority,
                  'processDefinitionId': item.processDefinitionId,
                  'processInstanceId': item.processInstanceId,
                  'taskDefinitionKey': item.taskDefinitionKey,
                  'processDefinitionName': item.processDefinitionName,
                  'suspended':
                      item.suspended == null ? null : (item.suspended! ? 1 : 0),
                  'assignee': item.assignee,
                  'followUpDate':
                      _dateTimeNullableConverter.encode(item.followUp),
                  'dueDate': _dateTimeNullableConverter.encode(item.dueDate),
                  'status': item.status,
                  'filterId': item.filterId,
                  'applicationStatus': item.applicationStatus,
                  'formUrl': item.formUrl,
                  'applicationId': item.formApplicationId,
                  'submissionDate': item.formSubmissionDate,
                  'submissionName': item.formSubmissionName,
                  'submissionId': item.formSubmissionId,
                  'formSubmissionData': item.formSubmissionData,
                  'isFormSubmissionDataUpdated':
                      item.isFormSubmissionDataUpdated == null
                          ? null
                          : (item.isFormSubmissionDataUpdated! ? 1 : 0),
                  'isFormSubmissionDone': item.isFormSubmissionDone == null
                      ? null
                      : (item.isFormSubmissionDone! ? 1 : 0),
                  'isFormDataUpdated': item.isFormDataUpdated == null
                      ? null
                      : (item.isFormDataUpdated! ? 1 : 0),
                  'isTaskDataChanged': item.isTaskDataChanged == null
                      ? null
                      : (item.isTaskDataChanged! ? 1 : 0),
                  'formSubmissionActionType': item.formSubmissionActionType
                }),
        _taskEntityDeletionAdapter = DeletionAdapter(
            database,
            'task',
            ['id'],
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'taskId': item.taskId,
                  'formResourceId': item.formResourceId,
                  'name': item.name,
                  'created': _dateTimeNullableConverter.encode(item.created),
                  'executionId': item.executionId,
                  'priority': item.priority,
                  'processDefinitionId': item.processDefinitionId,
                  'processInstanceId': item.processInstanceId,
                  'taskDefinitionKey': item.taskDefinitionKey,
                  'processDefinitionName': item.processDefinitionName,
                  'suspended':
                      item.suspended == null ? null : (item.suspended! ? 1 : 0),
                  'assignee': item.assignee,
                  'followUpDate':
                      _dateTimeNullableConverter.encode(item.followUp),
                  'dueDate': _dateTimeNullableConverter.encode(item.dueDate),
                  'status': item.status,
                  'filterId': item.filterId,
                  'applicationStatus': item.applicationStatus,
                  'formUrl': item.formUrl,
                  'applicationId': item.formApplicationId,
                  'submissionDate': item.formSubmissionDate,
                  'submissionName': item.formSubmissionName,
                  'submissionId': item.formSubmissionId,
                  'formSubmissionData': item.formSubmissionData,
                  'isFormSubmissionDataUpdated':
                      item.isFormSubmissionDataUpdated == null
                          ? null
                          : (item.isFormSubmissionDataUpdated! ? 1 : 0),
                  'isFormSubmissionDone': item.isFormSubmissionDone == null
                      ? null
                      : (item.isFormSubmissionDone! ? 1 : 0),
                  'isFormDataUpdated': item.isFormDataUpdated == null
                      ? null
                      : (item.isFormDataUpdated! ? 1 : 0),
                  'isTaskDataChanged': item.isTaskDataChanged == null
                      ? null
                      : (item.isTaskDataChanged! ? 1 : 0),
                  'formSubmissionActionType': item.formSubmissionActionType
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskEntity> _taskEntityInsertionAdapter;

  final UpdateAdapter<TaskEntity> _taskEntityUpdateAdapter;

  final DeletionAdapter<TaskEntity> _taskEntityDeletionAdapter;

  @override
  Future<TaskEntity?> findTaskById(int id) async {
    return _queryAdapter.query('SELECT * FROM task WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            taskId: row['taskId'] as String?,
            formResourceId: row['formResourceId'] as String?,
            name: row['name'] as String?,
            created:
                _dateTimeNullableConverter.decode(row['created'] as String?),
            executionId: row['executionId'] as String?,
            priority: row['priority'] as int?,
            processDefinitionId: row['processDefinitionId'] as String?,
            processInstanceId: row['processInstanceId'] as String?,
            taskDefinitionKey: row['taskDefinitionKey'] as String?,
            suspended: row['suspended'] == null
                ? null
                : (row['suspended'] as int) != 0,
            assignee: row['assignee'] as String?,
            followUp: _dateTimeNullableConverter
                .decode(row['followUpDate'] as String?),
            status: row['status'] as String?,
            filterId: row['filterId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formUrl: row['formUrl'] as String?,
            formApplicationId: row['applicationId'] as int?,
            formSubmissionDate: row['submissionDate'] as String?,
            formSubmissionName: row['submissionName'] as String?,
            formSubmissionId: row['submissionId'] as String?,
            isFormDataUpdated: row['isFormDataUpdated'] == null
                ? null
                : (row['isFormDataUpdated'] as int) != 0,
            formSubmissionData: row['formSubmissionData'] as String?,
            isFormSubmissionDataUpdated:
                row['isFormSubmissionDataUpdated'] == null
                    ? null
                    : (row['isFormSubmissionDataUpdated'] as int) != 0,
            isFormSubmissionDone: row['isFormSubmissionDone'] == null
                ? null
                : (row['isFormSubmissionDone'] as int) != 0,
            processDefinitionName: row['processDefinitionName'] as String?,
            dueDate:
                _dateTimeNullableConverter.decode(row['dueDate'] as String?),
            isTaskDataChanged: row['isTaskDataChanged'] == null
                ? null
                : (row['isTaskDataChanged'] as int) != 0,
            formSubmissionActionType:
                row['formSubmissionActionType'] as String?),
        arguments: [id]);
  }

  @override
  Future<TaskEntity?> findTaskByTaskId(String taskId) async {
    return _queryAdapter.query('SELECT * FROM task WHERE taskId = ?1',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            taskId: row['taskId'] as String?,
            formResourceId: row['formResourceId'] as String?,
            name: row['name'] as String?,
            created:
                _dateTimeNullableConverter.decode(row['created'] as String?),
            executionId: row['executionId'] as String?,
            priority: row['priority'] as int?,
            processDefinitionId: row['processDefinitionId'] as String?,
            processInstanceId: row['processInstanceId'] as String?,
            taskDefinitionKey: row['taskDefinitionKey'] as String?,
            suspended: row['suspended'] == null
                ? null
                : (row['suspended'] as int) != 0,
            assignee: row['assignee'] as String?,
            followUp: _dateTimeNullableConverter
                .decode(row['followUpDate'] as String?),
            status: row['status'] as String?,
            filterId: row['filterId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formUrl: row['formUrl'] as String?,
            formApplicationId: row['applicationId'] as int?,
            formSubmissionDate: row['submissionDate'] as String?,
            formSubmissionName: row['submissionName'] as String?,
            formSubmissionId: row['submissionId'] as String?,
            isFormDataUpdated: row['isFormDataUpdated'] == null
                ? null
                : (row['isFormDataUpdated'] as int) != 0,
            formSubmissionData: row['formSubmissionData'] as String?,
            isFormSubmissionDataUpdated:
                row['isFormSubmissionDataUpdated'] == null
                    ? null
                    : (row['isFormSubmissionDataUpdated'] as int) != 0,
            isFormSubmissionDone: row['isFormSubmissionDone'] == null
                ? null
                : (row['isFormSubmissionDone'] as int) != 0,
            processDefinitionName: row['processDefinitionName'] as String?,
            dueDate:
                _dateTimeNullableConverter.decode(row['dueDate'] as String?),
            isTaskDataChanged: row['isTaskDataChanged'] == null
                ? null
                : (row['isTaskDataChanged'] as int) != 0,
            formSubmissionActionType:
                row['formSubmissionActionType'] as String?),
        arguments: [taskId]);
  }

  @override
  Future<List<TaskEntity>> fetchAllTasksWithPagination(
    int offset,
    int count,
  ) async {
    return _queryAdapter.queryList('SELECT * FROM task LIMIT ?2 OFFSET ?1',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            taskId: row['taskId'] as String?,
            formResourceId: row['formResourceId'] as String?,
            name: row['name'] as String?,
            created:
                _dateTimeNullableConverter.decode(row['created'] as String?),
            executionId: row['executionId'] as String?,
            priority: row['priority'] as int?,
            processDefinitionId: row['processDefinitionId'] as String?,
            processInstanceId: row['processInstanceId'] as String?,
            taskDefinitionKey: row['taskDefinitionKey'] as String?,
            suspended: row['suspended'] == null
                ? null
                : (row['suspended'] as int) != 0,
            assignee: row['assignee'] as String?,
            followUp: _dateTimeNullableConverter
                .decode(row['followUpDate'] as String?),
            status: row['status'] as String?,
            filterId: row['filterId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formUrl: row['formUrl'] as String?,
            formApplicationId: row['applicationId'] as int?,
            formSubmissionDate: row['submissionDate'] as String?,
            formSubmissionName: row['submissionName'] as String?,
            formSubmissionId: row['submissionId'] as String?,
            isFormDataUpdated: row['isFormDataUpdated'] == null
                ? null
                : (row['isFormDataUpdated'] as int) != 0,
            formSubmissionData: row['formSubmissionData'] as String?,
            isFormSubmissionDataUpdated:
                row['isFormSubmissionDataUpdated'] == null
                    ? null
                    : (row['isFormSubmissionDataUpdated'] as int) != 0,
            isFormSubmissionDone: row['isFormSubmissionDone'] == null
                ? null
                : (row['isFormSubmissionDone'] as int) != 0,
            processDefinitionName: row['processDefinitionName'] as String?,
            dueDate:
                _dateTimeNullableConverter.decode(row['dueDate'] as String?),
            isTaskDataChanged: row['isTaskDataChanged'] == null
                ? null
                : (row['isTaskDataChanged'] as int) != 0,
            formSubmissionActionType:
                row['formSubmissionActionType'] as String?),
        arguments: [offset, count]);
  }

  @override
  Future<List<TaskEntity>> fetchAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM task LIMIT 15',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            taskId: row['taskId'] as String?,
            formResourceId: row['formResourceId'] as String?,
            name: row['name'] as String?,
            created:
                _dateTimeNullableConverter.decode(row['created'] as String?),
            executionId: row['executionId'] as String?,
            priority: row['priority'] as int?,
            processDefinitionId: row['processDefinitionId'] as String?,
            processInstanceId: row['processInstanceId'] as String?,
            taskDefinitionKey: row['taskDefinitionKey'] as String?,
            suspended: row['suspended'] == null
                ? null
                : (row['suspended'] as int) != 0,
            assignee: row['assignee'] as String?,
            followUp: _dateTimeNullableConverter
                .decode(row['followUpDate'] as String?),
            status: row['status'] as String?,
            filterId: row['filterId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formUrl: row['formUrl'] as String?,
            formApplicationId: row['applicationId'] as int?,
            formSubmissionDate: row['submissionDate'] as String?,
            formSubmissionName: row['submissionName'] as String?,
            formSubmissionId: row['submissionId'] as String?,
            isFormDataUpdated: row['isFormDataUpdated'] == null
                ? null
                : (row['isFormDataUpdated'] as int) != 0,
            formSubmissionData: row['formSubmissionData'] as String?,
            isFormSubmissionDataUpdated:
                row['isFormSubmissionDataUpdated'] == null
                    ? null
                    : (row['isFormSubmissionDataUpdated'] as int) != 0,
            isFormSubmissionDone: row['isFormSubmissionDone'] == null
                ? null
                : (row['isFormSubmissionDone'] as int) != 0,
            processDefinitionName: row['processDefinitionName'] as String?,
            dueDate:
                _dateTimeNullableConverter.decode(row['dueDate'] as String?),
            isTaskDataChanged: row['isTaskDataChanged'] == null
                ? null
                : (row['isTaskDataChanged'] as int) != 0,
            formSubmissionActionType:
                row['formSubmissionActionType'] as String?));
  }

  @override
  Future<int?> getCount() async {
    await _queryAdapter.queryNoReturn('SELECT COUNT(*) FROM task');
  }

  @override
  Future<void> deleteAllTasks() async {
    await _queryAdapter.queryNoReturn('DELETE FROM task');
  }

  @override
  Future<int> insertTask(TaskEntity task) {
    return _taskEntityInsertionAdapter.insertAndReturnId(
        task, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertTasks(List<TaskEntity> tasks) async {
    await _taskEntityInsertionAdapter.insertList(
        tasks, OnConflictStrategy.ignore);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    await _taskEntityUpdateAdapter.update(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTasks(List<TaskEntity> task) async {
    await _taskEntityUpdateAdapter.updateList(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    await _taskEntityDeletionAdapter.delete(task);
  }

  @override
  Future<void> deleteTasks(List<TaskEntity> tasks) async {
    await _taskEntityDeletionAdapter.deleteList(tasks);
  }
}

class _$FormsFlowFormsDao extends FormsFlowFormsDao {
  _$FormsFlowFormsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _formEntityInsertionAdapter = InsertionAdapter(
            database,
            'formsflowform',
            (FormEntity item) => <String, Object?>{
                  'id': item.id,
                  'formResponse': item.formResponse,
                  'formId': item.formId
                }),
        _formEntityUpdateAdapter = UpdateAdapter(
            database,
            'formsflowform',
            ['id'],
            (FormEntity item) => <String, Object?>{
                  'id': item.id,
                  'formResponse': item.formResponse,
                  'formId': item.formId
                }),
        _formEntityDeletionAdapter = DeletionAdapter(
            database,
            'formsflowform',
            ['id'],
            (FormEntity item) => <String, Object?>{
                  'id': item.id,
                  'formResponse': item.formResponse,
                  'formId': item.formId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FormEntity> _formEntityInsertionAdapter;

  final UpdateAdapter<FormEntity> _formEntityUpdateAdapter;

  final DeletionAdapter<FormEntity> _formEntityDeletionAdapter;

  @override
  Future<FormEntity?> findFormById(int id) async {
    return _queryAdapter.query('SELECT * FROM formsflowform WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FormEntity(
            id: row['id'] as int?,
            formId: row['formId'] as String?,
            formResponse: row['formResponse'] as String?),
        arguments: [id]);
  }

  @override
  Future<FormEntity?> findFormByFormId(String formId) async {
    return _queryAdapter.query('SELECT * FROM formsflowform WHERE formId = ?1',
        mapper: (Map<String, Object?> row) => FormEntity(
            id: row['id'] as int?,
            formId: row['formId'] as String?,
            formResponse: row['formResponse'] as String?),
        arguments: [formId]);
  }

  @override
  Future<List<FormEntity>> fetchAllForms() async {
    return _queryAdapter.queryList('SELECT * FROM formsflowform',
        mapper: (Map<String, Object?> row) => FormEntity(
            id: row['id'] as int?,
            formId: row['formId'] as String?,
            formResponse: row['formResponse'] as String?));
  }

  @override
  Future<int?> getCount() async {
    await _queryAdapter.queryNoReturn('SELECT COUNT(*) FROM formsflowform');
  }

  @override
  Future<void> deleteAllForms() async {
    await _queryAdapter.queryNoReturn('DELETE FROM formsflowform');
  }

  @override
  Future<void> insertForm(FormEntity Form) async {
    await _formEntityInsertionAdapter.insert(Form, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertForms(List<FormEntity> Forms) async {
    await _formEntityInsertionAdapter.insertList(
        Forms, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateForm(FormEntity Form) async {
    await _formEntityUpdateAdapter.update(Form, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateForms(List<FormEntity> Form) async {
    await _formEntityUpdateAdapter.updateList(Form, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteForm(FormEntity Form) async {
    await _formEntityDeletionAdapter.delete(Form);
  }

  @override
  Future<void> deleteForms(List<FormEntity> Forms) async {
    await _formEntityDeletionAdapter.deleteList(Forms);
  }
}

class _$ApplicationHistoryDao extends ApplicationHistoryDao {
  _$ApplicationHistoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _applicationHistoryEntityInsertionAdapter = InsertionAdapter(
            database,
            'applicationhistory',
            (ApplicationHistoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'applicationId': item.applicationId,
                  'taskId': item.taskId,
                  'formId': item.formId,
                  'formSubmissionId': item.formSubmissionId,
                  'formUrl': item.formUrl,
                  'created': item.created,
                  'applicationStatus': item.applicationStatus,
                  'submittedBy': item.submittedBy
                }),
        _applicationHistoryEntityUpdateAdapter = UpdateAdapter(
            database,
            'applicationhistory',
            ['id'],
            (ApplicationHistoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'applicationId': item.applicationId,
                  'taskId': item.taskId,
                  'formId': item.formId,
                  'formSubmissionId': item.formSubmissionId,
                  'formUrl': item.formUrl,
                  'created': item.created,
                  'applicationStatus': item.applicationStatus,
                  'submittedBy': item.submittedBy
                }),
        _applicationHistoryEntityDeletionAdapter = DeletionAdapter(
            database,
            'applicationhistory',
            ['id'],
            (ApplicationHistoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'applicationId': item.applicationId,
                  'taskId': item.taskId,
                  'formId': item.formId,
                  'formSubmissionId': item.formSubmissionId,
                  'formUrl': item.formUrl,
                  'created': item.created,
                  'applicationStatus': item.applicationStatus,
                  'submittedBy': item.submittedBy
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ApplicationHistoryEntity>
      _applicationHistoryEntityInsertionAdapter;

  final UpdateAdapter<ApplicationHistoryEntity>
      _applicationHistoryEntityUpdateAdapter;

  final DeletionAdapter<ApplicationHistoryEntity>
      _applicationHistoryEntityDeletionAdapter;

  @override
  Future<ApplicationHistoryEntity?> findHistoryById(int id) async {
    return _queryAdapter.query('SELECT * FROM applicationhistory WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ApplicationHistoryEntity(
            id: row['id'] as int?,
            formUrl: row['formUrl'] as String?,
            created: row['created'] as String?,
            taskId: row['taskId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formId: row['formId'] as String?,
            submittedBy: row['submittedBy'] as String?,
            formSubmissionId: row['formSubmissionId'] as String?,
            applicationId: row['applicationId'] as int?),
        arguments: [id]);
  }

  @override
  Future<ApplicationHistoryEntity?> findHistoryByTaskId(String taskId) async {
    return _queryAdapter.query(
        'SELECT * FROM applicationhistory WHERE taskId = ?1',
        mapper: (Map<String, Object?> row) => ApplicationHistoryEntity(
            id: row['id'] as int?,
            formUrl: row['formUrl'] as String?,
            created: row['created'] as String?,
            taskId: row['taskId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formId: row['formId'] as String?,
            submittedBy: row['submittedBy'] as String?,
            formSubmissionId: row['formSubmissionId'] as String?,
            applicationId: row['applicationId'] as int?),
        arguments: [taskId]);
  }

  @override
  Future<List<ApplicationHistoryEntity>> findHistoryByApplicationId(
      int applicationId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM applicationhistory WHERE applicationId = ?1',
        mapper: (Map<String, Object?> row) => ApplicationHistoryEntity(
            id: row['id'] as int?,
            formUrl: row['formUrl'] as String?,
            created: row['created'] as String?,
            taskId: row['taskId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formId: row['formId'] as String?,
            submittedBy: row['submittedBy'] as String?,
            formSubmissionId: row['formSubmissionId'] as String?,
            applicationId: row['applicationId'] as int?),
        arguments: [applicationId]);
  }

  @override
  Future<List<ApplicationHistoryEntity>> fetchAllApplicationHistory() async {
    return _queryAdapter.queryList('SELECT * FROM applicationhistory',
        mapper: (Map<String, Object?> row) => ApplicationHistoryEntity(
            id: row['id'] as int?,
            formUrl: row['formUrl'] as String?,
            created: row['created'] as String?,
            taskId: row['taskId'] as String?,
            applicationStatus: row['applicationStatus'] as String?,
            formId: row['formId'] as String?,
            submittedBy: row['submittedBy'] as String?,
            formSubmissionId: row['formSubmissionId'] as String?,
            applicationId: row['applicationId'] as int?));
  }

  @override
  Future<int?> getCount() async {
    await _queryAdapter
        .queryNoReturn('SELECT COUNT(*) FROM applicationhistory');
  }

  @override
  Future<void> deleteAllApplicationHistory() async {
    await _queryAdapter.queryNoReturn('DELETE FROM applicationhistory');
  }

  @override
  Future<void> deleteApplicationHistoryByApplicationId(
      int applicationId) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM applicationhistory WHERE applicationId = ?1',
        arguments: [applicationId]);
  }

  @override
  Future<void> insertApplicationHistory(
      ApplicationHistoryEntity applicationHistory) async {
    await _applicationHistoryEntityInsertionAdapter.insert(
        applicationHistory, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertApplicationHistorys(
      List<ApplicationHistoryEntity> applicationHistorys) async {
    await _applicationHistoryEntityInsertionAdapter.insertList(
        applicationHistorys, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateApplicationHistory(
      ApplicationHistoryEntity applicationHistory) async {
    await _applicationHistoryEntityUpdateAdapter.update(
        applicationHistory, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateApplicationHistorys(
      List<ApplicationHistoryEntity> applicationHistory) async {
    await _applicationHistoryEntityUpdateAdapter.updateList(
        applicationHistory, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteApplicationHistory(
      ApplicationHistoryEntity applicationHistory) async {
    await _applicationHistoryEntityDeletionAdapter.delete(applicationHistory);
  }

  @override
  Future<void> deleteApplicationHistorys(
      List<ApplicationHistoryEntity> applicationHistorys) async {
    await _applicationHistoryEntityDeletionAdapter
        .deleteList(applicationHistorys);
  }
}

// ignore_for_file: unused_element
final _dateTimeNullableConverter = DateTimeNullableConverter();
