/// [TaskDetailsCandidateResponse] class to parse
/// candidate response
class TaskDetailsCandidateResponse {
  final dynamic userId;
  final String? groupId;
  final String? type;

  TaskDetailsCandidateResponse({
    this.userId,
    this.groupId,
    this.type,
  });

  TaskDetailsCandidateResponse.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        groupId = json['groupId'] as String?,
        type = json['type'] as String?;

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'groupId': groupId, 'type': type};
}
