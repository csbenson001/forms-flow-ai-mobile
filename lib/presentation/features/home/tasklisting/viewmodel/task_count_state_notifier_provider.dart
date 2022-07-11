import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [TaskCountStateNotifier] to hold and update task count data
class TaskCountStateNotifier extends StateNotifier<TaskCountState> {
  TaskCountStateNotifier() : super(TaskCountState(count: 0));

  Future<void> updateState({int? count, bool? isLoading}) async {
    state = state.copyWith(count: count, isLoading: isLoading);
  }
}

/// [TaskCountState] data class to hold count and isPageLoading fields
class TaskCountState {
  final int? count;
  final bool? isLoading;

  TaskCountState({this.count, this.isLoading});

  TaskCountState copyWith({int? count, bool? isLoading}) {
    return TaskCountState(
        count: count ?? this.count, isLoading: isLoading ?? this.isLoading);
  }
}
