import 'package:flutter/material.dart';

/// [TaskVariableFilterDM] data class contains all task variable filters
class TaskVariableFilterDM {
  String? label;
  List<String>? comparess;
  String? key;
  List<String>? values;
  dynamic? type;
  String? name;
  bool? isSelected = false;
  List<DropdownMenuItem<Object?>> variableDropDownItems;
  String? selectedOperatorLabel;
  String? selectedOperatorValue;
  String? selectedVariableProperty;
  String? selectedVariableValue;
  bool? filterSaved;
  bool? enableEditing;

  @override
  String toString() {
    return 'TaskVariableFilterDM{comparess: $comparess, values: $values, selectedOperatorValue: $selectedOperatorValue, selectedVariableProperty: $selectedVariableProperty, selectedVariableValue: $selectedVariableValue}';
  }

  /// Named Constructor
  TaskVariableFilterDM.named(
      {required this.label,
      required this.comparess,
      required this.key,
      required this.values,
      required this.type,
      required this.name,
      required this.isSelected,
      required this.variableDropDownItems,
      required this.enableEditing,
      required this.selectedOperatorLabel,
      required this.selectedOperatorValue,
      required this.selectedVariableValue,
      required this.selectedVariableProperty});

  /// Method to build drodpwn items
  /// Input Parameters
  /// List[Data]
  /// ---> Returns List[DropdownMenuItem<Object?>]
  static List<DropdownMenuItem<Object?>> buildDropdownTestItems(
      List<String> data) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in data) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i),
        ),
      );
    }
    return items;
  }

  /// Method to find task variable filter item
  /// Input Parameters
  /// [Key]
  /// List[TaskVariableFilterDM]
  /// ---> Returns [TaskVariableFilterDM]
  static TaskVariableFilterDM variableFilterItem(
      {required String key,
      required List<TaskVariableFilterDM> sortFilterList}) {
    TaskVariableFilterDM taskVariableFilterDM =
        sortFilterList.singleWhere((element) => key == element.key);
    return taskVariableFilterDM;
  }

  /// Method to transform [Element] into [TaskVariableFilterDM]
  /// Input Parameters
  /// [T]
  /// [TaskVariableFilterDM]
  /// ---> Returns [TaskVariableFilterDM]
  static TaskVariableFilterDM transform({required dynamic element}) {
    return TaskVariableFilterDM.named(
        label: element['label'],
        name: element['name'],
        comparess: element['compares'],
        key: element['key'],
        type: element['type'],
        isSelected: false,
        values: element['values'],
        enableEditing: true,
        selectedOperatorLabel: null,
        selectedOperatorValue: null,
        selectedVariableProperty: null,
        selectedVariableValue: null,
        variableDropDownItems: buildDropdownTestItems(element['compares']));
  }
}
