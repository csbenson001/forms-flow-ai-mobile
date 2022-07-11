import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_submission_response.freezed.dart';
part 'form_submission_response.g.dart';

@freezed
class FormSubmissionResponse with _$FormSubmissionResponse {
  const factory FormSubmissionResponse({
    @JsonKey(
      name: "_id",
    )
        String? id,
    String? form,
    String? owner,
    List<dynamic>? roles,
    List<dynamic>? access,
    @Default({})
        dynamic? metadata,
    @Default({})
        dynamic? data,
    List<dynamic>? externalIds,
    String? created,
    String? modified,
    String? state,
  }) = _FormSubmissionResponse;

  factory FormSubmissionResponse.fromJson(Map<String, dynamic> json) =>
      _$FormSubmissionResponseFromJson(json);
}
