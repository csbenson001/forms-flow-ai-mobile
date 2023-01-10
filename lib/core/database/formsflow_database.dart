// ignore_for_file: depend_on_referenced_packages

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
    version: FormsFlowDatabase.newDBVersion)
abstract class FormsFlowDatabase extends FloorDatabase {
  // Database name
  static const String databaseName = "formsflowai.db";

  // Old Database Version
  static const oldDBVersion = 0;

  // New database version
  static const int newDBVersion = 1;

  // Variable to get taskDao
  TaskDao get taskDao;

  // Variable to get formsDao
  FormsFlowFormsDao get formsFlowFormDao;

  // Variable to get applicationHistoryDao
  ApplicationHistoryDao get applicationHistoryDao;
}
