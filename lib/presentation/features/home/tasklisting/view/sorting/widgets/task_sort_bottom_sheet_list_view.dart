import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../model/task_sort_filter_data_model.dart';

/// [TaskSortBottomSheetListView] to display task sort list view
class TaskSortBottomSheetListView extends ConsumerWidget {
  const TaskSortBottomSheetListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiSortFiltersList =
        ref.watch(taskListViewModelProvider).uiSortFiltersList;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: uiSortFiltersList.length,
      controller: ModalScrollController.of(context),
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return itemInflateSortFilterRow(uiSortFiltersList[index], index, ref);
      },
    );
  }

  Widget itemInflateSortFilterRow(
      TaskSortFilterDM taskFilterDM, int index, WidgetRef ref) {
    return InkWell(
        onTap: () {
          ref
              .read(taskListViewModelProvider)
              .updateSelectedSortItem(taskFilterDM, index);
        },
        child: Container(
          padding: const EdgeInsets.all(Dimens.spacing_16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: Dimens.spacing_16),
                child: Icon(
                  taskFilterDM.iconData,
                  size: Dimens.size_20,
                  color: taskFilterDM.isSelected
                      ? AppColor.primarycolor
                      : Colors.black54,
                ),
              ),
              Text(
                taskFilterDM.sortLabel,
                style: AppTextStyles.semiBoldTextStyle(
                    fontSize: Dimens.font_16,
                    textColor: taskFilterDM.isSelected
                        ? AppColor.primarycolor
                        : Colors.black),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: Dimens.spacing_16),
                child: SvgPicture.asset(
                  taskFilterDM.isSelected
                      ? "assets/images/ic_circle_check.svg"
                      : "assets/images/ic_circle_uncheck.svg",
                  color: taskFilterDM.isSelected
                      ? AppColor.primarycolor
                      : Colors.grey,
                  width: Dimens.spacing_24,
                  height: Dimens.spacing_24,
                ),
              )
            ],
          ),
        ));
  }
}
