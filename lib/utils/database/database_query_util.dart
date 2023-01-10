import 'package:formsflowai/core/database/entity/task_entity.dart';

import '../../core/api/post/task/tasklist_sort.dart';
import '../../core/database/entity/form_entity.dart';

class DatabaseQueryUtil {
  static const String spaceQueryExtra = " ";

  /// Function to generate local database query
  /// Input Parameters
  /// [Id]
  /// [FirstResult]
  /// [MaxResults]
  /// [TaskSortPostModel]
  /// ---> [Returns] Query String
  static String generateSqlQuery(String id, int firstResult, int maxResults,
      TaskSortPostModel taskSortingPostModel) {
    // Query string
    String queryString = '';
    queryString +=
        'SELECT * FROM task${spaceQueryExtra}ORDER BY$spaceQueryExtra';
    for (int i = 0; i < taskSortingPostModel.sorting!.length; i++) {
      queryString +=
          '${taskSortingPostModel.sorting![i].sortBy} ${taskSortingPostModel.sorting![i].sortOrder?.toUpperCase()}';
      if (taskSortingPostModel.sorting!.length - 1 > i) {
        queryString += ",";
      }
    }
    queryString += '${spaceQueryExtra}LIMIT $maxResults OFFSET $firstResult';
    return queryString;
  }

  /// Function to decode [DateTime]
  /// Input Parameters
  /// [DateTimeString]
  /// ---> [Returns] DateTime
  static DateTime? decode(String? dateTimeString) {
    if (dateTimeString == null) {
      return null;
    }
    return DateTime.parse(dateTimeString).toUtc();
  }

  /// Function to encode [DateTime] to insert into the floor entity
  /// Input Parameters
  /// [DateTime]
  /// ---> [Returns] DateTimeString
  static String? encode(DateTime? dateTimeValue) {
    if (dateTimeValue == null) {
      return null;
    }
    return dateTimeValue.toUtc().toIso8601String();
  }

  /// Function to generate sql query to return count of available offline tasks
  /// ---> [Returns] Query String
  static String generateTotalOfflineTaskSqlQuery() {
    // Query string
    return 'SELECT COUNT(id) FROM task';
  }

  /// Function to generate sql query to check if the task exists
  /// ---> [Returns] Query String
  static String generateTaskAddedSqlQuery({TaskEntity? task}) {
    // Query string
    return 'SELECT COUNT(id) FROM task WHERE taskId = :${task?.taskId}';
  }

  /// Function to generate sql query to check if the task exists
  /// ---> [Returns] Query String
  static String generateFormAddedSqlQuery({FormEntity? formEntity}) {
    // Query string
    return 'SELECT COUNT(id) FROM formsflowform WHERE formId = :${formEntity?.formId}';
  }
}
