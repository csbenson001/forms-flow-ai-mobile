import 'package:freezed_annotation/freezed_annotation.dart';

part 'formio_roles_response.freezed.dart';
part 'formio_roles_response.g.dart';

@freezed
class FormioRolesResponse with _$FormioRolesResponse {
  const factory FormioRolesResponse({
    List<Form>? form,
  }) = _FormioRolesResponse;

  factory FormioRolesResponse.fromJson(Map<String, dynamic> json) =>
      _$FormioRolesResponseFromJson(json);
}

@freezed
class Form with _$Form {
  const factory Form({
    String? roleId,
    String? type,
  }) = _Form;

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
}
