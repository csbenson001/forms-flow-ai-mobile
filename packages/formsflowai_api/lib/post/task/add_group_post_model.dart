class AddGroupPostModel {
  final String? groupId;
  final String? type;

  AddGroupPostModel({
    this.groupId,
    this.type,
  });

  AddGroupPostModel.fromJson(Map<String, dynamic> json)
      : groupId = json['groupId'] as String?,
        type = json['type'] as String?;

  Map<String, dynamic> toJson() => {'groupId': groupId, 'type': type};
}
