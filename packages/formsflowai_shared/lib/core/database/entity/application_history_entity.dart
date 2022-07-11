import 'package:floor/floor.dart';

// Entity to hold application history Data
@Entity(tableName: "applicationhistory", indices: [], primaryKeys: ["id"])
class ApplicationHistoryEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "id")
  final int? id;
  final int? applicationId;
  final String? taskId;
  String? formUrl;
  String? created;
  String? applicationStatus;

  ApplicationHistoryEntity(
      {this.id,
      this.formUrl,
      this.created,
      this.taskId,
      this.applicationStatus,
      this.applicationId});

  @override
  String toString() {
    return 'ApplicationHistory{id: $id, applicationId: $applicationId, taskId: $taskId, formUrl: $formUrl, created: $created, applicationStatus: $applicationStatus}';
  }
}
