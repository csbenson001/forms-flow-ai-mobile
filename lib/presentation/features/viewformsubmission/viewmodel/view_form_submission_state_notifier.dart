import 'package:formsflowai/presentation/features/taskdetails/model/formio/formio_model.dart';
import 'package:formsflowai/presentation/features/viewformsubmission/state/view_form_submission_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Defining [viewFormSubmissionStateProvider] as an auto disposable
/// provider ref object for the [ViewModel] class [ ViewFormSubmissionStateNotifier]
final viewFormSubmissionStateProvider = StateNotifierProvider.autoDispose<
    ViewFormSubmissionStateNotifier, ViewFormSubmissionState>((ref) {
  return ViewFormSubmissionStateNotifier();
});

class ViewFormSubmissionStateNotifier
    extends StateNotifier<ViewFormSubmissionState> {
  ViewFormSubmissionStateNotifier()
      : super(const ViewFormSubmissionState(
            isLoadingForm: false,
            formIoModel: FormIoModel(),
            isNoFormResourceFound: false));

  /// Method to update form loading
  void updateFormLoading({required bool isLoading}) {
    state = state.copyWith(isLoadingForm: isLoading);
  }

  /// Method to update form resource found
  void updateNoFormResourceFound() {
    state = state.copyWith(isNoFormResourceFound: true);
  }

  /// Method to update formIoModel
  void updateFormioModel({required FormIoModel formIoModel}) {
    state = state.copyWith(formIoModel: formIoModel, isLoadingForm: false);
  }
}
