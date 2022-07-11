import 'dart:convert';

import 'package:floor/floor.dart';

// Entity to hold form data
@Entity(tableName: "formsflowform", indices: [
  Index(value: ['formId'], unique: true)
], primaryKeys: [
  "id"
])
class FormEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "id")
  final int? id;

  @ColumnInfo(name: "formResponse")
  String? formResponse;

  @ColumnInfo(name: "formId")
  String? formId;

  FormEntity({this.id, this.formId, this.formResponse});

  static FormEntity transformFormFromFormMap(
      {String? formId, Map<String, dynamic>? formMapResponse}) {
    final String encodedFormsComponents = json.encode(formMapResponse);
    return FormEntity(
        id: null, formResponse: encodedFormsComponents, formId: formId);
  }

  static FormEntity transformFormFromFormString(
      {String? formId, String? formResponseEncoded}) {
    return FormEntity(
        id: null, formResponse: formResponseEncoded, formId: formId);
  }

  @override
  String toString() {
    return 'FormsFlowForm{id: $id, formData: $formResponse, formId: $formId}';
  }
}
