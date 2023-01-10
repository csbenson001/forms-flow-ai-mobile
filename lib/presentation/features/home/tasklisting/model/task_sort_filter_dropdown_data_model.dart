/// [TaskSortFilterDropDownDM] Data class contains filter dropdown
/// related data fields
class TaskSortFilterDropDownDM {
  var filterName = "";
  bool isAscending = false;

  TaskSortFilterDropDownDM();

  TaskSortFilterDropDownDM.named(
      {required this.filterName, required this.isAscending});

  /// Method to get sort list
  /// ---> Returns List[TaskSortFilterDropDownDM]
  static List<TaskSortFilterDropDownDM> getSortList() {
    List<TaskSortFilterDropDownDM> mData = List.empty(growable: true);
    mData.add(TaskSortFilterDropDownDM.named(
        filterName: "Created", isAscending: false));
    mData.add(TaskSortFilterDropDownDM.named(
        filterName: "Priority", isAscending: false));
    mData.add(TaskSortFilterDropDownDM.named(
        filterName: "Assignee", isAscending: false));
    mData.add(TaskSortFilterDropDownDM.named(
        filterName: "Task Name", isAscending: false));
    mData.add(TaskSortFilterDropDownDM.named(
        filterName: "Follow-up Date", isAscending: false));
    return mData;
  }
}
