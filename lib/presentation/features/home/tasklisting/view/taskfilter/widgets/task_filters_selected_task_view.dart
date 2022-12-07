import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai/shared/app_status.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../core/networkmanager/internet_connectivity_provider.dart';
import '../../../../../../../shared/app_strings.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../../utils/general_util.dart';
import '../../../../../../base/widgets/base_consumer_widget.dart';

/// [TaskFiltersListView] to display filters dropdown views
class TaskFiltersListView extends BaseConsumerWidget {
  const TaskFiltersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortFilterItem = ref.watch(taskListViewModelProvider
        .select((value) => value.selectedSortFilterItem));
    // final isLoading =
    //     ref.watch(taskCountProvider.select((value) => value.isLoading));
    // final taskCount =
    //     ref.watch(taskCountProvider.select((value) => value.count));

    final isLoading = ref
        .watch(taskListViewModelProvider.select((value) => value.pageStatus));

    final taskCount = ref.watch(
        taskListViewModelProvider.select((value) => value.totalTaskCount));

    final isInternetAvailable = ref.watch(internetConnectivityProvider);

    return isLoading != null && isLoading == PageStatus.success
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
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: Dimens.spacing_2, left: Dimens.spacing_10),
                    child: InkWell(
                        onTap: () {},
                        child: Container(
                            height: Dimens.size_30,
                            width: Dimens.size_30,
                            decoration: const BoxDecoration(
                                color: AppColor.grey6, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.filter_alt,
                              size: Dimens.size_20,
                              color: Colors.black,
                            ))),
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
