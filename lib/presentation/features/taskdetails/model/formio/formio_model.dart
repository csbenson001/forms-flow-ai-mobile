import 'package:freezed_annotation/freezed_annotation.dart';

part 'formio_model.freezed.dart';

/// [FormIoModel] freezed data model class to hold formio data fields
@freezed
class FormIoModel with _$FormIoModel {
  const factory FormIoModel(
      {String? formComponents,
      String? formData,
      String? formUrl,
      String? formSubmissionUrl,
      bool? readOnly,
      String? formResourceId,
      String? formSubmissionId}) = _FormIoModel;
}
