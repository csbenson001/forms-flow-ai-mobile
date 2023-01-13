import 'package:flutter/material.dart';

/// [TaskSortFilterDM] data class contains sorting related data fields
class TaskSortFilterDM {
  dynamic sortLabel;
  String sortOrder;
  bool isSelected;
  dynamic sortByValue;
  IconData iconData;

  TaskSortFilterDM.named(
      {required this.sortLabel,
      required this.sortByValue,
      required this.sortOrder,
      required this.isSelected,
      required this.iconData});

  /// Method to get sort filters
  /// ---> Returns List[TaskSortFilterDM]
  static List<TaskSortFilterDM> getSortFilters() {
    List<TaskSortFilterDM> mData = List.empty(growable: true);
    mData.add(TaskSortFilterDM.named(
        sortLabel: "Created",
        sortByValue: "created",
        sortOrder: "desc",
        isSelected: true,
        iconData: Icons.update_sharp));
    mData.add(TaskSortFilterDM.named(
        sortLabel: "Priority",
        sortByValue: "priority",
        sortOrder: "asc",
        isSelected: false,
        iconData: Icons.low_priority_sharp));
    mData.add(TaskSortFilterDM.named(
        sortLabel: "Assignee",
        sortByValue: "assignee",
        sortOrder: "asc",
        isSelected: false,
        iconData: Icons.supervised_user_circle_sharp));
    mData.add(TaskSortFilterDM.named(
        sortLabel: "Task Name",
        sortByValue: "name",
        sortOrder: "asc",
        isSelected: false,
        iconData: Icons.task_sharp));
    mData.add(TaskSortFilterDM.named(
        sortLabel: "Due Date",
        sortByValue: "dueDate",
        sortOrder: "asc",
        isSelected: false,
        iconData: Icons.calendar_today_sharp));
    mData.add(TaskSortFilterDM.named(
        sortLabel: "Follow-up Date",
        sortByValue: "followUpDate",
        sortOrder: "desc",
        isSelected: false,
        iconData: Icons.date_range_sharp));
    return mData;
  }

  @override
  String toString() {
    return 'TaskSortFilterDM{sortLabel: $sortLabel, sortOrder: $sortOrder, isSelected: $isSelected, sortByValue: $sortByValue, iconData: $iconData}';
  }
}
