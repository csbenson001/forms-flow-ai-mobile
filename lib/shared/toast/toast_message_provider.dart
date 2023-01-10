/// [ToastStateDM] class to show success/error toast messages
class ToastStateDM {
  final String? error;
  final String? success;

  const ToastStateDM({this.error, this.success});

  ToastStateDM copyWith({String? error, String? info}) {
    return ToastStateDM(
        error: error ?? this.error, success: info ?? success);
  }
}
