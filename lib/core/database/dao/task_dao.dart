import 'package:floor/floor.dart';

import '../entity/task_entity.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM task WHERE id = :id')
  Future<TaskEntity?> findTaskById(int id);

  @Query('SELECT * FROM task WHERE taskId = :taskId')
  Future<TaskEntity?> findTaskByTaskId(String taskId);

  @Query('SELECT * FROM task LIMIT :count OFFSET :offset')
  Future<List<TaskEntity>> fetchAllTasksWithPagination(int offset, int count);

  @Query('SELECT * FROM task LIMIT 15')
  Future<List<TaskEntity>> fetchAllTasks();

  @Query('SELECT COUNT(*) FROM task')
  Future<int?> getCount();

  @insert
  Future<int> insertTask(TaskEntity task);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertTasks(List<TaskEntity> tasks);

  @update
  Future<void> updateTask(TaskEntity task);

  @update
  Future<void> updateTasks(List<TaskEntity> task);

  @delete
  Future<void> deleteTask(TaskEntity task);

  @delete
  Future<void> deleteTasks(List<TaskEntity> tasks);

  @Query('DELETE FROM task')
  Future<void> deleteAllTasks();
}
