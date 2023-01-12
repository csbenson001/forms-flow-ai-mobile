import 'package:floor/floor.dart';

import '../entity/task_entity.dart';

/// [TaskDao] class contains methods
/// to insert, update, fetch and delete task entity data
@dao
abstract class TaskDao {
  /// Function to fetch task by Id
  /// Input Parameters
  /// [ID]
  /// ---> Returns [TaskEntity]?
  @Query('SELECT * FROM task WHERE id = :id')
  Future<TaskEntity?> fetchTaskById(int id);

  /// Function to fetch task by TaskID
  /// Input Parameters
  /// [TaskID]
  /// ---> Returns [TaskEntity]?
  @Query('SELECT * FROM task WHERE taskId = :taskId')
  Future<TaskEntity?> fetchTaskByTaskId(String taskId);

  /// Function to fetch all tasks with pagination
  /// Input Parameters
  /// [Offset]
  /// [MaxCount]
  /// ---> Returns [List<TaskEntity>]
  @Query('SELECT * FROM task LIMIT :count OFFSET :offset')
  Future<List<TaskEntity>> fetchAllTasksWithPagination(int offset, int count);

  /// Function to fetch all tasks
  /// ---> Returns [List<TaskEntity>]
  @Query('SELECT * FROM task')
  Future<List<TaskEntity>> fetchAllTasks();

  /// Function to insert task entity
  /// Input Parameters
  /// [TaskEntity]
  @insert
  Future<int> insertTask(TaskEntity task);

  /// Function to insert List<Tasks>
  /// Input Parameters
  /// [List<TaskEntity>]
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertTasks(List<TaskEntity> tasks);

  /// Function to update task entity
  /// Input Parameters
  /// [TaskEntity]
  @update
  Future<void> updateTask(TaskEntity task);

  /// Function to update List<Tasks>
  /// Input Parameters
  /// [List<TaskEntity>]
  @update
  Future<void> updateTasks(List<TaskEntity> task);

  /// Function to delete task entity
  /// Input Parameters
  /// [TaskEntity]
  @delete
  Future<void> deleteTask(TaskEntity task);

  /// Function to delete all task data
  @Query('DELETE FROM task')
  Future<void> deleteAllTasks();
}
