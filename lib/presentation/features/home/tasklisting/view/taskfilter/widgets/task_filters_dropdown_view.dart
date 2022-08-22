import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/core/networkmanager/internet_connectivity_provider.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/dropdown/dropdown_below.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../../utils/general_util.dart';

/// [TaskFiltersDropdownView] to display filters dropdown views
class TaskFiltersDropdownView extends BaseConsumerWidget {
  const TaskFiltersDropdownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortFilterItem = ref.watch(taskListViewModelProvider
        .select((value) => value.selectedSortFilterItem));
    final taskDropDownItems = ref.watch(taskFilterDropDownItemsProvider);
    final isLoading =
        ref.watch(taskCountProvider.select((value) => value.isLoading));
    final taskCount =
        ref.watch(taskCountProvider.select((value) => value.count));
    final isInternetAvailable = ref.watch(internetConnectivityProvider);

    return isLoading != null && !isLoading
        ? Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(
                left: Dimens.spacing_20,
                top: Dimens.spacing_16,
                right: Dimens.spacing_4),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    isInternetAvailable != ConnectivityResult.none
                        ? !GeneralUtil.isStringEmpty(
                                selectedSortFilterItem.name ?? '')
                            ? "${selectedSortFilterItem.name} (${taskCount.toString()})"
                            : "${Strings.taskListingLabelAllTasks}(${taskCount.toString()})"
                        : "${Strings.taskListingLabelAllTasks}(${taskCount.toString()})",
                    style: AppTextStyles.boldTextStyle(
                        fontSize: Dimens.font_16, textColor: Colors.black87),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const Spacer(),
                if (isInternetAvailable != ConnectivityResult.none)
                  Expanded(
                      flex: 4,
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: Dimens.spacing_24,
                            top: Dimens.spacing_none,
                            right: Dimens.spacing_24),
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(Dimens.opacity_0_4),
                              offset: const Offset(
                                  Dimens.offset_4, Dimens.offset_4),
                              blurRadius: Dimens.radius_6,
                            ),
                          ],
                          color: Colors.white,
                          shape: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.radius_10)),
                          ),
                        ),
                        child: DropdownBelow(
                          itemWidth: Dimens.size_125,
                          isDense: false,
                          itemTextstyle: const TextStyle(
                              fontSize: Dimens.font_12,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black),
                          boxTextstyle: const TextStyle(
                              fontSize: Dimens.font_12,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black),
                          boxPadding: const EdgeInsets.fromLTRB(
                              Dimens.spacing_8,
                              Dimens.spacing_4,
                              Dimens.spacing_4,
                              Dimens.spacing_8),
                          boxWidth: Dimens.size_125,
                          boxHeight: Dimens.size_40,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColor.primarycolor,
                            size: Dimens.size_20,
                          ),
                          onChanged: (selectedItem) {
                            ref
                                .read(taskListViewModelProvider)
                                .onChangeDropdown(selectedItem);
                          },
                          items: taskDropDownItems,
                          value: selectedSortFilterItem,
                        ),
                      ))
              ],
            ))
        : Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                      left: Dimens.spacing_20,
                      top: Dimens.spacing_10,
                      right: Dimens.spacing_4),
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: Dimens.size_100,
                        height: Dimens.size_20,
                        padding: const EdgeInsets.only(
                            top: Dimens.spacing_5,
                            bottom: Dimens.spacing_5,
                            left: Dimens.spacing_8),
                        decoration: const BoxDecoration(
                          color: AppColor.grey7,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimens.radius_8),
                              bottomRight: Radius.circular(Dimens.radius_8),
                              topLeft: Radius.circular(Dimens.radius_8),
                              bottomLeft: Radius.circular(Dimens.radius_8)),
                        ),
                      ))),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: Dimens.spacing_16,
                      top: Dimens.spacing_8,
                      right: Dimens.spacing_16),
                  width: Dimens.size_100,
                  height: Dimens.size_15,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.grey7,
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimens.radius_3))),
                ),
              ),
            ],
          );
  }
}
