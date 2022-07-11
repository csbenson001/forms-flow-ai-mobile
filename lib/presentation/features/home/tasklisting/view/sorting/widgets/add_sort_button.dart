import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/sorting/widgets/task_sort_filter_bottom_sheet.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_status.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/shimmer/shimmer_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../../shared/app_text_styles.dart';

/// [AddSortButtonView]
/// ---> Returns [AddSortButton]
class AddSortButtonView extends BaseConsumerWidget {
  const AddSortButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(taskVariablesLoadingProvider);

    return isLoading == PageStatus.loading
        ? ShimmerWidgets.getShimmerContainer(
            margin: const EdgeInsets.only(
                left: Dimens.spacing_8,
                top: Dimens.spacing_8,
                right: Dimens.spacing_18),
            padding: const EdgeInsets.only(left: Dimens.spacing_8),
            width: Dimens.size_120,
            height: Dimens.size_15,
            borderRadius:
                const BorderRadius.all(Radius.circular(Dimens.radius_8)))
        : Container(
            alignment: Alignment.topRight,
            width: Dimens.size_120,
            margin: const EdgeInsets.only(
                left: Dimens.spacing_8,
                top: Dimens.spacing_16,
                right: Dimens.spacing_18),
            padding: const EdgeInsets.only(left: Dimens.spacing_4),
            decoration: const ShapeDecoration(
              color: AppColor.primarycolor,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.radius_10)),
              ),
            ),
            child: InkWell(
                onTap: () {
                  showMaterialModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const TaskSortFilterBottomSheetView(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          top: Dimens.spacing_8, bottom: Dimens.spacing_8),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: Dimens.size_20,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.spacing_8,
                            bottom: Dimens.spacing_8,
                            left: Dimens.spacing_4),
                        child: Text(
                          Strings.taskListingButtonAddSorting,
                          style: AppTextStyles.semiBoldTextStyle(
                              fontSize: Dimens.font_12,
                              textColor: Colors.white),
                        )),
                  ],
                )));
  }
}
