import 'package:formsflowai_shared/utils/shared_general_util.dart';

/// [FormSubmissionPostModel] class to send the application/json
/// POST body on the form submission api call
class FormSubmissionPostModel {
  final Variables? variables;

  FormSubmissionPostModel({
    this.variables,
  });

  Map<String, dynamic> toJson() => {'variables': variables?.toJson()};

  static FormSubmissionPostModel transform(
      {required String formUrl,
      required int applicationId,
      required String? actionType}) {
    if (!SharedGeneralUtil.isStringEmpty(actionType)) {
      FormSubmissionPostModel formSubmissionPostModel = FormSubmissionPostModel(
          variables: Variables(
              action: Action(value: actionType),
              applicationId: ApplicationId(value: applicationId.toString()),
              formUrl: FormUrl(value: formUrl)));

      return formSubmissionPostModel;
    } else {
      FormSubmissionPostModel formSubmissionPostModel = FormSubmissionPostModel(
          variables: Variables(
              applicationId: ApplicationId(value: applicationId.toString()),
              formUrl: FormUrl(value: formUrl)));
      return formSubmissionPostModel;
    }
  }

  @override
  String toString() {
    return 'FormSubmissionPostModel{variables: $variables}';
  }
}

class Variables {
  final FormUrl? formUrl;
  final ApplicationId? applicationId;
  final Action? action;

  Variables({
    this.formUrl,
    this.applicationId,
    this.action,
  });

  Map<String, dynamic> toJson() {
    if (action != null && action?.value != null) {
      return {
        'formUrl': formUrl?.toJson(),
        'applicationId': applicationId?.toJson(),
        'action': action?.toJson()
      };
    } else {
      return {
        'formUrl': formUrl?.toJson(),
        'applicationId': applicationId?.toJson()
      };
    }
  }

  @override
  String toString() {
    return 'Variables{formUrl: $formUrl, applicationId: $applicationId, action: $action}';
  }
}

class FormUrl {
  final String? value;

  FormUrl({
    this.value,
  });

  FormUrl.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String?;

  Map<String, dynamic> toJson() => {'value': value};

  @override
  String toString() {
    return 'FormUrl{value: $value}';
  }
}

class ApplicationId {
  final String? value;

  ApplicationId({
    this.value,
  });

  ApplicationId.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String?;

  Map<String, dynamic> toJson() => {'value': value};

  @override
  String toString() {
    return 'ApplicationId{value: $value}';
  }
}

class Action {
  final String? value;

  Action({
    this.value,
  });

  Action.fromJson(Map<String, dynamic> json) : value = json['value'] as String?;

  Map<String, dynamic> toJson() => {'value': value};

  @override
  String toString() {
    return 'Action{value: $value}';
  }
}
