import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formsflowai/presentation/base/widgets/base_hooks_consumer_widget.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/variablefilters/widgets/added_filter_count_view.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/variablefilters/widgets/selected_variable_filter_list_view.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/viewmodel/task_list_screen_providers.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/checkbox/checkbox_group.dart';
import 'package:formsflowai_shared/widgets/checkbox/checkbox_orientation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_strings.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../model/task_variable_filter_data_model.dart';

class TaskVariableFiltersInputView extends BaseHooksConsumerWidget {
  const TaskVariableFiltersInputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiVariablesList =
        ref.watch(taskListViewModelProvider).uiVariablesFiltersList;
    final uiSelectedCheckList =
        ref.watch(taskListViewModelProvider).selectedCheckBoxList;

    final isAllFilteredSelected = useState(true);

    return Padding(
        padding: const EdgeInsets.only(
            left: Dimens.spacing_16,
            right: Dimens.spacing_16,
            top: Dimens.spacing_16),
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radius_8),
            ),
            child: Container(
                padding: const EdgeInsets.only(
                    top: Dimens.spacing_6, bottom: Dimens.spacing_16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.primarycolor),
                    borderRadius: BorderRadius.circular(Dimens.radius_8),
                    shape: BoxShape.rectangle),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.spacing_8,
                              top: Dimens.spacing_8,
                              bottom: Dimens.spacing_16),
                          child: Text(
                            Strings.taskListingLabelFilterByTasks,
                            style: AppTextStyles.mediumTextStyle(
                                fontSize: Dimens.font_15,
                                textColor: AppColor.primarycolor),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              ref
                                  .read(taskListViewModelProvider)
                                  .fetchSelectedVariableList();
                              ref
                                  .read(showTaskVariablesViewProvider.notifier)
                                  .state = false;
                            },
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    left: Dimens.spacing_6,
                                    top: Dimens.spacing_8,
                                    right: Dimens.spacing_16,
                                    bottom: Dimens.spacing_16),
                                child: Icon(
                                  Icons.close,
                                  size: Dimens.size_18,
                                  color: AppColor.primarycolor,
                                )))
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: Dimens.spacing_8,
                            top: Dimens.spacing_8,
                            bottom: Dimens.spacing_16,
                            right: Dimens.spacing_2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  isAllFilteredSelected.value =
                                      !isAllFilteredSelected.value;
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: Dimens.spacing_4,
                                        right: Dimens.spacing_4,
                                        top: Dimens.spacing_4,
                                        bottom: Dimens.spacing_4),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColor.primarycolor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(Dimens.radius_10))),
                                    child: Text(
                                      isAllFilteredSelected.value
                                          ? Strings.taskListingLabelAll
                                              .toUpperCase()
                                          : Strings.taskListingLabelAny
                                              .toUpperCase(),
                                      style: AppTextStyles.mediumTextStyle(
                                          fontSize: Dimens.font_13,
                                          textColor: Colors.white),
                                    ))),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.only(
                                  left: Dimens.spacing_4,
                                  top: Dimens.spacing_6),
                              child: Text(
                                Strings.taskListingLabelCriteria,
                                style: AppTextStyles.mediumTextStyle(
                                    fontSize: Dimens.font_12,
                                    textColor: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                            ))
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: Dimens.spacing_8),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          spacing: Dimens.spacing_8,
                          runAlignment: WrapAlignment.start,
                          runSpacing: Dimens.spacing_10,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          children:
                              getVariableFilterItems(ref, uiVariablesList),
                        )),
                    const SelectedVariableFilterListView(),
                    Container(
                        margin: const EdgeInsets.only(top: Dimens.spacing_16),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: Dimens.spacing_8),
                              child: Text(
                                Strings.taskListingLabelVariablesIgnoreCase,
                                style: AppTextStyles.mediumTextStyle(
                                    fontSize: Dimens.font_12,
                                    textColor: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: Dimens.spacing_4),
                              child: GroupedCheckbox(
                                onChanged: (value) {
                                  // taskListingController
                                  //     .updateSelectedCheckBoxString(value);
                                },
                                orientation: CheckboxOrientation.HORIZONTAL,
                                itemList: const ["name", "value"],
                                activeColor: AppColor.primarycolor,
                                checkedItemList: uiSelectedCheckList,
                                chechBoxHeight: Dimens.size_18,
                                chechBoxWidth: Dimens.size_18,
                              ),
                            )
                          ],
                        )),
                    const AddedFilterCountView()
                  ],
                ))));
  }

  List<Widget> getVariableFilterItems(WidgetRef ref, List uiVariablesList) {
    List<Widget> list = List.empty(growable: true);
    for (var index = 0; index < uiVariablesList.length; index++) {
      list.add(itemInflateVariableFilterRow(index, ref, uiVariablesList));
    }
    return list;
  }

  Widget itemInflateVariableFilterRow(
      int index, WidgetRef ref, List uiVariablesList) {
    return InkWell(
        onTap: () {
          ref.read(taskListViewModelProvider).updateSelectedVariableFilterList(
              TaskVariableFilterDM.transform(
                  element: ref
                      .read(taskListViewModelProvider)
                      .uiVariablesFiltersList[index]),
              index);
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                child: Container(
                    margin: index == 0
                        ? const EdgeInsets.only(left: Dimens.spacing_8)
                        : const EdgeInsets.only(left: Dimens.spacing_16),
                    decoration: ShapeDecoration(
                      shadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(4, 4),
                          blurRadius: 6.0,
                        ),
                      ],
                      color: Colors.white,
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                left: Dimens.spacing_10,
                                right: Dimens.spacing_none,
                                top: Dimens.spacing_10,
                                bottom: Dimens.spacing_10),
                            child: Text(
                              uiVariablesList[index]['label']!,
                              style: AppTextStyles.mediumTextStyle(
                                  fontSize: Dimens.font_12,
                                  textColor: Colors.black),
                            )),
                        Container(
                          margin: const EdgeInsets.only(
                              left: Dimens.spacing_8,
                              top: Dimens.spacing_8,
                              right: Dimens.spacing_6),
                          child: const Icon(
                            Icons.add_circle_rounded,
                            size: Dimens.size_20,
                            color: AppColor.primarycolor,
                          ),
                        )
                      ],
                    )),
              ),
            ]));
  }
}
