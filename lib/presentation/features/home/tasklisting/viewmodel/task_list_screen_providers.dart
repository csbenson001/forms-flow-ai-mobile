import 'package:flutter/material.dart';
import 'package:formsflowai_api/response/filter/get_filters_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/app_status.dart';

/// [taskFilterDropDownItemsProvider] to handle dropdown task filters
final taskFilterDropDownItemsProvider =
    StateProvider<List<DropdownMenuItem<Object?>>>((ref) {
  return [];
});

/// [filtersListProvider] provider to handle added filters
final filtersListProvider = StateProvider<List<FiltersResponse>>((ref) {
  return [];
});

// /// [taskCountProvider] provider to handle task count data
// final taskCountProvider =
//     StateNotifierProvider.autoDispose<TaskCountStateNotifier, TaskCountState>(
//         (ref) {
//   return TaskCountStateNotifier();
// });

/// [taskVariablesLoadingProvider] provider to specify page status
final taskVariablesLoadingProvider = StateProvider<PageStatus>((ref) {
  return PageStatus.initial;
});

/// [showTaskVariablesViewProvider] provider to show/hide task variable view
final showTaskVariablesViewProvider = StateProvider<bool>((ref) {
  return false;
});

/// [authorizationExpiredFailureProvider] provider to listen to token expiry
final authorizationExpiredFailureProvider = StateProvider<bool>((ref) {
  return false;
});

/// [showHideFloatingActionButtonProvider] provider to
/// show/hide floating button
final showHideFloatingActionButtonProvider = StateProvider<bool>((ref) {
  return false;
});
