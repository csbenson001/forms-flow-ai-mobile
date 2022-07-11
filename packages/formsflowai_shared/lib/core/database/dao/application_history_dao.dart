import 'package:floor/floor.dart';

import '../entity/application_history_entity.dart';

@dao
abstract class ApplicationHistoryDao {
  @Query('SELECT * FROM applicationhistory WHERE id = :id')
  Future<ApplicationHistoryEntity?> findHistoryById(int id);

  @Query('SELECT * FROM applicationhistory WHERE taskId = :taskId')
  Future<ApplicationHistoryEntity?> findHistoryByTaskId(String taskId);

  @Query(
      'SELECT * FROM applicationhistory WHERE applicationId = :applicationId')
  Future<List<ApplicationHistoryEntity>> findHistoryByApplicationId(
      int applicationId);

  @Query('SELECT * FROM applicationhistory')
  Future<List<ApplicationHistoryEntity>> fetchAllApplicationHistory();

  @Query('SELECT COUNT(*) FROM applicationhistory')
  Future<int?> getCount();

  @insert
  Future<void> insertApplicationHistory(
      ApplicationHistoryEntity applicationHistory);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertApplicationHistorys(
      List<ApplicationHistoryEntity> applicationHistorys);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateApplicationHistory(
      ApplicationHistoryEntity applicationHistory);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateApplicationHistorys(
      List<ApplicationHistoryEntity> applicationHistory);

  @delete
  Future<void> deleteApplicationHistory(
      ApplicationHistoryEntity applicationHistory);

  @delete
  Future<void> deleteApplicationHistorys(
      List<ApplicationHistoryEntity> applicationHistorys);

  @Query('DELETE FROM applicationhistory')
  Future<void> deleteAllApplicationHistory();

  @Query('DELETE FROM applicationhistory WHERE applicationId = :applicationId')
  Future<void> deleteApplicationHistoryByApplicationId(int applicationId);
}
