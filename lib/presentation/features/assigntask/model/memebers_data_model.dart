import 'package:formsflowai_api/response/task/details/list_members_response.dart';

/// [MembersDM] data class contains member related data fields
/// used in the assign task screen to display
/// available members
class MembersDM {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? isSelected;

  /// [MembersDM] named constructor
  MembersDM.name(
      {this.id, this.firstName, this.lastName, this.email, this.isSelected});

  /// Method to transform [ListMembersResponse] into [MembersDM]
  static List<MembersDM> transform(List<ListMembersResponse> data) {
    List<MembersDM> mData = List.empty(growable: true);
    data.forEach((element) {
      mData.add(MembersDM.name(
          id: element.id,
          email: element.email,
          firstName: element.firstName,
          lastName: element.lastName,
          isSelected: false));
    });
    return mData;
  }

  @override
  String toString() {
    return 'MembersModel{id: $id, firstName: $firstName, lastName: $lastName, email: $email, isSelected: $isSelected}';
  }
}
