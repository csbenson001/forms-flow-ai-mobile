/// [DeleteGroupPostModel] class to send the application/json
/// POST body on the delete group api call
class DeleteGroupPostModel {
  final String? groupId;
  final String? type;
  final String? userId;

  DeleteGroupPostModel({this.groupId, this.type, this.userId});

  DeleteGroupPostModel.fromJson(Map<String, dynamic> json)
      : groupId = json['groupId'] as String?,
        type = json['type'] as String?,
        userId = json['userId'] as String?;

  Map<String, dynamic> toJson() =>
      {'groupId': groupId, 'type': type, 'userId': userId};
}
