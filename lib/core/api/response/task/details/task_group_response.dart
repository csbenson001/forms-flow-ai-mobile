class TaskGroupsResponse {
  final dynamic userId;
  final String? groupId;
  final String? type;

  TaskGroupsResponse({
    this.userId,
    this.groupId,
    this.type,
  });

  TaskGroupsResponse.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        groupId = json['groupId'] as String?,
        type = json['type'] as String?;

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'groupId': groupId, 'type': type};

  @override
  String toString() {
    return '$groupId';
  }

  static String getGroupList({required List<TaskGroupsResponse> data}) {
    List<String?> groupList = data.map((e) => e.groupId).toList();
    return groupList.join(',');
  }
}
