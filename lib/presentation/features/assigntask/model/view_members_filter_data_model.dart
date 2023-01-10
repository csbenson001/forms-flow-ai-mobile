import 'package:flutter/material.dart';

import '../../../../shared/app_strings.dart';
import 'memebers_data_model.dart';

/// [ViewMembersFilterDM] data model class contains data fields
/// to hold the filters used in member selection
/// in the assign task screen
class ViewMembersFilterDM {
  MembersFilterType? membersFilterType;
  String? title;
  bool? isSelected = false;

  /// [ViewMembersFilterDM] named constructor
  ViewMembersFilterDM.named(this.membersFilterType, this.title);

  /// private method to get Filter List
  /// ---> Returns [ViewMembersFilterDM] Filter List
  static List<ViewMembersFilterDM> _getFilterList() {
    List<ViewMembersFilterDM> mData = List.empty(growable: true);
    mData.add(ViewMembersFilterDM.named(
        MembersFilterType.firstName, Strings.assignLabelSearchByFirstName));
    mData.add(ViewMembersFilterDM.named(
        MembersFilterType.lastName, Strings.assignLabelSearchByLastName));
    mData.add(ViewMembersFilterDM.named(
        MembersFilterType.email, Strings.assignLabelSearchByEmail));
    return mData;
  }

  /// Method to get default filter model used in the assign task screen
  /// ---> Returns [ViewMembersFilterDM]
  static ViewMembersFilterDM getInitialFilterModel() {
    return ViewMembersFilterDM.named(
        MembersFilterType.firstName, Strings.assignLabelSearchByFirstName);
  }

  /// Method to build filters dropdown views to filter members
  /// ---> Returns [DropdownMenuItem<Object?] dropdown list
  static List<DropdownMenuItem<Object?>> buildDropdownTestItems() {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _getFilterList()) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i.title!),
        ),
      );
    }
    return items;
  }

  /// Method to get the display text(username/email/lastname) based on
  /// filter selection
  /// Parameters
  /// [MembersDM]
  /// [ViewMembersFilterDM]
  /// ---> Returns [DisplayText]
  static String getDisplayText(MembersDM response, ViewMembersFilterDM dm) {
    switch (dm.membersFilterType ?? MembersFilterType.firstName) {
      case MembersFilterType.firstName:
        String firstName = response.firstName ?? '';
        String lastName = response.lastName ?? '';
        return "$firstName\n($firstName $lastName)";
      case MembersFilterType.lastName:
        String firstName = response.firstName ?? '';
        String lastName = response.lastName ?? '';
        return "$firstName\n($firstName $lastName)";
      case MembersFilterType.email:
        String email = response.email ?? Strings.assignLabelNoEmailAvailable;
        String firstName = response.firstName ?? '';
        String lastName = response.lastName ?? '';
        return "$email\n($firstName $lastName)";
      default:
        return response.firstName ?? '';
    }
  }

  /// Method to get the display text(username/email/lastname) based on
  /// filter selection
  /// [MembersDM]
  /// [ViewMembersFilterDM]
  /// ---> Returns [DisplayFullText]
  static String getDisplayFullText(MembersDM response, ViewMembersFilterDM dm) {
    String firstName = response.firstName ?? '';
    String lastName = response.lastName ?? '';
    return "($firstName " "$lastName)";
  }
}

/// [MembersFilterType] Enum to specify Filter Type
enum MembersFilterType {
  firstName,

  lastName,

  email
}
