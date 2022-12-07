import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'converter/task_date_time_converter.dart';
import 'dao/application_history_dao.dart';
import 'dao/formsflowforms_dao.dart';
import 'dao/task_dao.dart';
import 'entity/application_history_entity.dart';
import 'entity/form_entity.dart';
import 'entity/task_entity.dart';

part 'formsflow_database.g.dart';

// Type converter to convert datetime
@TypeConverters([DateTimeNullableConverter])
// Database with the entity values
@Database(
    entities: [TaskEntity, FormEntity, ApplicationHistoryEntity],
    version: FormsFlowDatabase.NEW_DB_VERSION)
abstract class FormsFlowDatabase extends FloorDatabase {
  // Database name
  static const String DATABASE_NAME = "formsflowai.db";

  // Old Database Version
  static const OLD_DB_VERSION = 0;

  // New database version
  static const int NEW_DB_VERSION = 1;

  // Variable to get taskDao
  TaskDao get taskDao;

  // Variable to get formsDao
  FormsFlowFormsDao get formsFlowFormDao;

  // Variable to get applicationHistoryDao
  ApplicationHistoryDao get applicationHistoryDao;
}
