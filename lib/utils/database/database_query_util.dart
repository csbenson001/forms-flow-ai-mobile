import 'package:formsflowai_api/post/task/tasklist_sort.dart';

class DatabaseQueryUtil {
  static const String space_Query_Extra = " ";

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
        'SELECT * FROM task${space_Query_Extra}ORDER BY${space_Query_Extra}';
    for (int i = 0; i < taskSortingPostModel.sorting!.length; i++) {
      queryString +=
          '${taskSortingPostModel.sorting![i].sortBy} ${taskSortingPostModel.sorting![i].sortOrder?.toUpperCase()}';
      if (taskSortingPostModel.sorting!.length - 1 > i) {
        queryString += ",";
      }
    }
    queryString +=
        '${space_Query_Extra}LIMIT ${maxResults} OFFSET ${firstResult}';
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

  /// Function to fetch local task count
  /// ---> [Returns] Query String
  static String generateTotalOfflineTaskSqlQuery() {
    // Query string
    String queryString = 'SELECT COUNT(id) FROM task';
    return queryString;
  }
}
