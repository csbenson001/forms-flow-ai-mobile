import 'package:formsflowai/presentation/features/taskdetails/model/formio/formio_model.dart';
import 'package:formsflowai/presentation/features/viewformsubmission/view/view_form_submission_screen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_form_submission_state.freezed.dart';

/// [ViewFormSubmissionState] to hold [ViewFormSubmissionScreen] state values
@freezed
class ViewFormSubmissionState with _$ViewFormSubmissionState {
  const factory ViewFormSubmissionState(
      {bool? isNoFormResourceFound,
      FormIoModel? formIoModel,
      bool? isLoadingForm}) = _ViewFormSubmissionState;
}
