import 'package:formsflowai/presentation/features/home/tasklisting/model/task_variable_filter_data_model.dart';

/// [TaskSelectedVariablesCountDM] data class contains selected variables
/// count with its variable filter name
class TaskSelectedVariablesCountDM {
  String? label;
  int? count;

  /// Method to transform List[SelectedVariablesList] into
  /// List[TaskSelectedVariablesCountDM]
  /// Input Parameters
  /// List[UIVariablesFiltersList]
  /// List[SelectedVariablesList]
  /// ---> Returns List[TaskSelectedVariablesCountDM]
  static List<TaskSelectedVariablesCountDM> transform(
      dynamic uiVariablesFiltersList,
      List<TaskVariableFilterDM> selectedVariablesList) {
    List<TaskSelectedVariablesCountDM> mData = List.empty(growable: true);
    for (int j = 0; j < uiVariablesFiltersList.length; j++) {
      TaskSelectedVariablesCountDM dm = TaskSelectedVariablesCountDM();
      dm.label = uiVariablesFiltersList[j]['label'];
      int count = getAddedVariableCount(
          uiVariablesFiltersList[j], selectedVariablesList);
      dm.count = count;
      if (count > 0) {
        mData.add(dm);
      }
    }
    return mData;
  }

  /// Method to get added variable count
  /// Input Parameters
  /// [SelectedVariableFilter]
  /// List[TaskVariableFilterDM]
  /// ---> Returns [Count]
  static int getAddedVariableCount(dynamic selectedVariableFilter,
      List<TaskVariableFilterDM> selectedVariablesFiltersList) {
    int count = 0;
    for (int i = 0; i < selectedVariablesFiltersList.length; i++) {
      if (selectedVariablesFiltersList[i].key ==
          selectedVariableFilter['key']) {
        count = count + 1;
      }
    }
    return count;
  }
}
