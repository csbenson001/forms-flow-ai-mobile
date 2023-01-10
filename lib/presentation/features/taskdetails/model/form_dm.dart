import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/database/entity/form_entity.dart';

/// [FormDM] data model class to hold form data fields
class FormDM {
  String? id;
  String? formResponse;
  Map<String, dynamic>? formsMapResponse;
  String? title;

  /// Method to transform [Response] into [FormDM]
  /// Input Parameters
  /// [Response]
  /// ---> Returns [FormDM]
  static FormDM transform(Response response) {
    FormDM formDM = FormDM();
    formDM.formResponse = json.encode(response.data);
    formDM.formsMapResponse = response.data;
    formDM.id = response.data['id'];
    formDM.title = response.data['title'];
    return formDM;
  }

  /// Method to transform [Response] into [FormDM]
  /// Input Parameters
  /// [Response]
  /// ---> Returns [FormDM]
  static FormDM transformIsolatedResponse(Map<String, dynamic> response) {
    FormDM formDM = FormDM();
    formDM.formResponse = json.encode(response);
    formDM.formsMapResponse = response;
    formDM.id = response['id'];
    formDM.title = response['title'];
    return formDM;
  }

  /// Method to transform [FormEntity] into [FormDM]
  /// Input Parameters
  /// [FormEntity]
  /// ---> Returns [FormDM]
  static FormDM transformFromFromData(FormEntity formsFlowForm) {
    FormDM formDM = FormDM();
    formDM.formResponse = formsFlowForm.formResponse;
    try {
      formDM.formsMapResponse = json.decode(formsFlowForm.formResponse ?? '');
    } catch (e) {
      formDM.formsMapResponse = {};
    }
    formDM.title = formDM.title;
    formDM.id = formsFlowForm.formId;
    return formDM;
  }

  @override
  String toString() {
    return 'FormDM{id: $id, formResponse: $formResponse, title: $title}';
  }
}
