/// [TaskCountResponse] class to parse
/// total task count
class TaskCountResponse {
  final int? count;

  TaskCountResponse({
    this.count,
  });

  TaskCountResponse.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?;

  Map<String, dynamic> toJson() => {'count': count};
}
