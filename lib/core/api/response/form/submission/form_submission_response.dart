import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_submission_response.freezed.dart';
part 'form_submission_response.g.dart';

@freezed
class FormSubmissionResponse with _$FormSubmissionResponse {
  const factory FormSubmissionResponse({
    // ignore: invalid_annotation_target
    @JsonKey(
      name: "_id",
    )
        String? id,
    String? form,
    String? owner,
    List<dynamic>? roles,
    List<dynamic>? access,
    @Default({})
        // ignore: unnecessary_question_mark
        dynamic? metadata,
    @Default({})
        // ignore: unnecessary_question_mark
        dynamic? data,
    List<dynamic>? externalIds,
    String? created,
    String? modified,
    String? state,
  }) = _FormSubmissionResponse;

  factory FormSubmissionResponse.fromJson(Map<String, dynamic> json) =>
      _$FormSubmissionResponseFromJson(json);
}
