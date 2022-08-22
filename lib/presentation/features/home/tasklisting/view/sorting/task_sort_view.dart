import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_status.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/shared/formsflow_api_constants.dart';
import 'package:formsflowai_shared/widgets/shimmer/shimmer_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../shared/app_text_styles.dart';
import '../../model/task_sort_filter_data_model.dart';

/// [TaskSortView] widget to show task sort filter views
class TaskSortView extends BaseConsumerWidget {
  const TaskSortView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch for selected sort filter list changes
    final sortedFilterList =
        ref.watch(taskListViewModelProvider).selectedSortFilterList;

    /// Watch for task variables data loading from remote
    final isLoading = ref.watch(taskVariablesLoadingProvider);

    return isLoading == PageStatus.loading
        ? Align(
            alignment: Alignment.topLeft,
            child: ShimmerWidgets.getShimmerContainer(
                margin: const EdgeInsets.only(
                    left: Dimens.spacing_24,
                    top: Dimens.spacing_16,
                    right: Dimens.spacing_24),
                padding: const EdgeInsets.only(left: Dimens.spacing_8),
                width: Dimens.size_120,
                height: Dimens.size_15,
                borderRadius:
                    const BorderRadius.all(Radius.circular(Dimens.radius_5))))
        : Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
                left: Dimens.spacing_2,
                right: Dimens.spacing_2,
                top: Dimens.spacing_8),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: Dimens.spacing_none,
              runAlignment: WrapAlignment.start,
              runSpacing: Dimens.spacing_none,
              crossAxisAlignment: WrapCrossAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: getSortItems(sortedFilterList, ref),
            ));
  }

  /// Method to get sort items
  /// Input Parameters
  /// List[TaskSortFilterDM]
  /// [Ref]
  /// --> Returns List[Widget]
  List<Widget> getSortItems(
      List<TaskSortFilterDM> sortedFilterList, WidgetRef ref) {
    List<Widget> list = List.empty(growable: true);
    for (var index = 0; index < sortedFilterList.length; index++) {
      list.add(inflateFilterRow(sortedFilterList[index], index, ref));
    }
    return list;
  }

  /// Method to to return inflate filter item widget
  /// Input Parameters
  /// [TaskSortFilterDM]
  /// [Index]
  /// [Ref]
  /// ---> Returns [Widget]
  Widget inflateFilterRow(TaskSortFilterDM dm, int index, WidgetRef ref) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            child: Container(
                margin: const EdgeInsets.only(
                    left: Dimens.spacing_16, top: Dimens.spacing_16),
                decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(Dimens.opacity_0_4),
                      offset: const Offset(Dimens.offset_4, Dimens.offset_4),
                      blurRadius: Dimens.radius_6,
                    ),
                  ],
                  color: Colors.white,
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimens.radius_10)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            left: Dimens.spacing_10,
                            right: Dimens.spacing_10,
                            top: Dimens.spacing_10,
                            bottom: Dimens.spacing_10),
                        child: Text(
                          dm.sortLabel,
                          style: AppTextStyles.mediumTextStyle(
                              fontSize: Dimens.font_12,
                              textColor: Colors.black),
                        )),
                    InkWell(
                        onTap: () {
                          ref
                              .read(taskListViewModelProvider)
                              .updateSelectedAscDescSortItem(dm, index);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: Dimens.spacing_4,
                                right: Dimens.spacing_4,
                                top: Dimens.spacing_8),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(6),
                              color: AppColor.primarycolor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: Dimens.spacing_2),
                              child: SvgPicture.asset(
                                dm.sortOrder ==
                                        FormsFlowAIAPIConstants.ASCENDING_ORDER
                                    ? "assets/images/ic_ascending.svg"
                                    : "assets/images/ic_descending.svg",
                                width: Dimens.size_18,
                                height: Dimens.size_18,
                                color: Colors.white,
                              ),
                            ))),
                    InkWell(
                        onTap: () {
                          ref
                              .read(taskListViewModelProvider)
                              .deleteSortItemFromList(index);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: Dimens.spacing_4,
                                right: Dimens.spacing_4,
                                top: Dimens.spacing_8),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.circular(Dimens.radius_6),
                              color: AppColor.red,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: Dimens.spacing_2,
                                  right: Dimens.spacing_2),
                              child: Icon(
                                Icons.close,
                                size: Dimens.size_18,
                                color: Colors.white,
                              ),
                            ))),
                  ],
                )),
          ),
        ]);
  }
}
