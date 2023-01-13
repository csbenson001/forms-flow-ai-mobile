import 'package:floor/floor.dart';

import '../entity/application_history_entity.dart';

/// [ApplicationHistoryDao] class contains methods
/// to insert, update, fetch and delete application history entity data
@dao
abstract class ApplicationHistoryDao {
  /// Function to fetch application history by Id
  /// Input Parameters
  /// [ID]
  /// ---> Returns [ApplicationHistoryEntity]?
  @Query('SELECT * FROM applicationhistory WHERE id = :id')
  Future<ApplicationHistoryEntity?> fetchApplicationHistoryById(int id);

  /// Function to fetch application history by TaskID
  /// Input Parameters
  /// [TaskID]
  /// ---> Returns [ApplicationHistoryEntity]?
  @Query('SELECT * FROM applicationhistory WHERE taskId = :taskId')
  Future<ApplicationHistoryEntity?> fetchApplicationHistoryByTaskId(
      String taskId);

  /// Function to fetch application history by applicationId
  /// Input Parameters
  /// [ApplicationID]
  /// ---> Returns [List<ApplicationHistoryEntity>]
  @Query(
      'SELECT * FROM applicationhistory WHERE applicationId = :applicationId')
  Future<List<ApplicationHistoryEntity>> fetchApplicationHistoryByApplicationId(
      int applicationId);

  /// Function to fetch all application history
  /// ---> Returns [List<ApplicationHistoryEntity>]
  @Query('SELECT * FROM applicationhistory')
  Future<List<ApplicationHistoryEntity>> fetchAllApplicationHistory();

  /// Function to insert application history data
  /// Input Parameters
  /// [ApplicationHistoryEntity]
  @insert
  Future<void> insertApplicationHistory(
      ApplicationHistoryEntity applicationHistory);

  /// Function to insert all application history data
  /// Input Parameters
  /// [List<ApplicationHistoryEntity>]
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllApplicationHistory(
      List<ApplicationHistoryEntity> applicationHistorys);

  /// Function to update application history data
  /// Input Parameters
  /// [ApplicationHistoryEntity]
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateApplicationHistory(
      ApplicationHistoryEntity applicationHistory);

  /// Function to update all application history data
  /// Input Parameters
  /// [List<ApplicationHistoryEntity>]
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateAllApplicationHistory(
      List<ApplicationHistoryEntity> applicationHistory);

  /// Function to delete application history data
  /// Input Parameters
  /// [ApplicationHistoryEntity]
  @delete
  Future<void> deleteApplicationHistory(
      ApplicationHistoryEntity applicationHistory);

  /// Function to delete all application history data
  /// Input Parameters
  /// [List<ApplicationHistoryEntity>]
  @delete
  Future<void> deleteAllApplicationHistoryList(
      List<ApplicationHistoryEntity> applicationHistorys);

  /// Function to delete all application history data
  @Query('DELETE FROM applicationhistory')
  Future<void> deleteAllApplicationHistory();

  /// Function to delete application history data by applicationId
  /// Input Parameters
  /// [ApplicationId]
  @Query('DELETE FROM applicationhistory WHERE applicationId = :applicationId')
  Future<void> deleteApplicationHistoryByApplicationId(int applicationId);
}
