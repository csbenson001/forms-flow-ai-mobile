import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai/core/module/providers/view_model_provider.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/variablefilters/widgets/task_variable_filter_view.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/variablefilters/widgets/task_variable_selected_filters_view.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_status.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/shimmer/shimmer_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../shared/app_text_styles.dart';
import '../../../../../../shared/imageassets/formsflowai_image_assets.dart';

/// [TaskFilterView] to show task filter views
class TaskFilterView extends BaseConsumerWidget {
  const TaskFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch for show task filter view
    final showTaskFiltersView = ref.watch(showTaskVariablesViewProvider);
    final isPageLoading = ref.watch(taskVariablesLoadingProvider);

    /// Watch for selectedVariablesList changes
    final selectedVariablesList =
        ref.watch(taskListViewModelProvider).selectedVariablesFiltersList;

    return isPageLoading == PageStatus.loading
        ? ShimmerWidgets.getShimmerContainer(
            width: Dimens.size_150,
            height: Dimens.size_20,
            padding: const EdgeInsets.all(Dimens.spacing_none),
            margin: const EdgeInsets.only(
                left: Dimens.spacing_24,
                right: Dimens.spacing_24,
                top: Dimens.spacing_16,
                bottom: Dimens.spacing_8),
            borderRadius: BorderRadius.circular(Dimens.radius_none))
        : showTaskFiltersView
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const TaskVariableFiltersInputView(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(Dimens.spacing_8),
                margin: const EdgeInsets.only(
                    left: Dimens.spacing_16,
                    right: Dimens.spacing_24,
                    top: Dimens.spacing_16,
                    bottom: Dimens.spacing_8),
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
                        BorderRadius.all(Radius.circular(Dimens.spacing_8)),
                  ),
                ),
                child: InkWell(
                    onTap: () {
                      ref.read(showTaskVariablesViewProvider.notifier).state =
                          true;
                    },
                    child: selectedVariablesList.isEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                Strings.taskListingLabelFilterByTasks,
                                style: AppTextStyles.semiBoldTextStyle(
                                    fontSize: Dimens.font_14,
                                    textColor: Colors.black54),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: Dimens.spacing_2,
                                    left: Dimens.spacing_10),
                                child: SvgPicture.asset(
                                  FormsFlowAIImageAssets.imagesFilter,
                                  width: Dimens.size_26,
                                  height: Dimens.size_26,
                                ),
                              )
                            ],
                          )
                        : const TaskVariableSelectedFiltersView()));
  }
}
