/// [TaskVariablesResponse] class to parse
/// task variables response data
class TaskVariablesResponse {
  final ApplicationStatus? applicationStatus;
  final Select? select;
  final FormUrl? formUrl;
  final FormName? formName;
  final SubmissionDate? submissionDate;
  final SubmitterName? submitterName;
  final ApplicationId? applicationId;
  final TextField? textField;
  final TextArea? textArea;

  TaskVariablesResponse({
    this.applicationStatus,
    this.select,
    this.formUrl,
    this.formName,
    this.submissionDate,
    this.submitterName,
    this.applicationId,
    this.textField,
    this.textArea,
  });

  TaskVariablesResponse.fromJson(Map<String, dynamic> json)
      : applicationStatus =
            (json['applicationStatus'] as Map<String, dynamic>?) != null
                ? ApplicationStatus.fromJson(
                    json['applicationStatus'] as Map<String, dynamic>)
                : null,
        select = (json['select'] as Map<String, dynamic>?) != null
            ? Select.fromJson(json['select'] as Map<String, dynamic>)
            : null,
        formUrl = (json['formUrl'] as Map<String, dynamic>?) != null
            ? FormUrl.fromJson(json['formUrl'] as Map<String, dynamic>)
            : null,
        formName = (json['formName'] as Map<String, dynamic>?) != null
            ? FormName.fromJson(json['formName'] as Map<String, dynamic>)
            : null,
        submissionDate =
            (json['submissionDate'] as Map<String, dynamic>?) != null
                ? SubmissionDate.fromJson(
                    json['submissionDate'] as Map<String, dynamic>)
                : null,
        submitterName = (json['submitterName'] as Map<String, dynamic>?) != null
            ? SubmitterName.fromJson(
                json['submitterName'] as Map<String, dynamic>)
            : null,
        applicationId = (json['applicationId'] as Map<String, dynamic>?) != null
            ? ApplicationId.fromJson(
                json['applicationId'] as Map<String, dynamic>)
            : null,
        textField = (json['textField'] as Map<String, dynamic>?) != null
            ? TextField.fromJson(json['textField'] as Map<String, dynamic>)
            : null,
        textArea = (json['textArea'] as Map<String, dynamic>?) != null
            ? TextArea.fromJson(json['textArea'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'applicationStatus': applicationStatus?.toJson(),
        'select': select?.toJson(),
        'formUrl': formUrl?.toJson(),
        'formName': formName?.toJson(),
        'submissionDate': submissionDate?.toJson(),
        'submitterName': submitterName?.toJson(),
        'applicationId': applicationId?.toJson(),
        'textField': textField?.toJson(),
        'textArea': textArea?.toJson()
      };
}

class ApplicationStatus {
  final String? type;
  final String? value;
  final ValueInfo? valueInfo;

  ApplicationStatus({
    this.type,
    this.value,
    this.valueInfo,
  });

  ApplicationStatus.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as String?,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class Select {
  final String? type;
  final String? value;
  final ValueInfo? valueInfo;

  Select({
    this.type,
    this.value,
    this.valueInfo,
  });

  Select.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as String?,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class FormUrl {
  final String? type;
  final String? value;
  final ValueInfo? valueInfo;

  FormUrl({
    this.type,
    this.value,
    this.valueInfo,
  });

  FormUrl.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as String?,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class FormName {
  final String? type;
  final String? value;
  final ValueInfo? valueInfo;

  FormName({
    this.type,
    this.value,
    this.valueInfo,
  });

  FormName.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as String?,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class SubmissionDate {
  final String? type;
  final String? value;
  final ValueInfo? valueInfo;

  SubmissionDate({
    this.type,
    this.value,
    this.valueInfo,
  });

  SubmissionDate.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as String?,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class SubmitterName {
  final String? type;
  final String? value;
  final ValueInfo? valueInfo;

  SubmitterName({
    this.type,
    this.value,
    this.valueInfo,
  });

  SubmitterName.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as String?,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class ApplicationId {
  final String? type;
  final dynamic value;
  final ValueInfo? valueInfo;

  ApplicationId({
    this.type,
    this.value,
    this.valueInfo,
  });

  ApplicationId.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as dynamic,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class TextField {
  final String? type;
  final String? value;
  final ValueInfo? valueInfo;

  TextField({
    this.type,
    this.value,
    this.valueInfo,
  });

  TextField.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as String?,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class TextArea {
  final String? type;
  final String? value;
  final ValueInfo? valueInfo;

  TextArea({
    this.type,
    this.value,
    this.valueInfo,
  });

  TextArea.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        value = json['value'] as String?,
        valueInfo = (json['valueInfo'] as Map<String, dynamic>?) != null
            ? ValueInfo.fromJson(json['valueInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'type': type, 'value': value, 'valueInfo': valueInfo?.toJson()};
}

class ValueInfo {
  ValueInfo();

  ValueInfo.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}
