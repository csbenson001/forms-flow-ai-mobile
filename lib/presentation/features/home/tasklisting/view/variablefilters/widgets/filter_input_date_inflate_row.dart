import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/dropdown/dropdown_below.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_strings.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../base/widgets/base_consumer_widget.dart';
import '../../../model/task_variable_filter_data_model.dart';
import 'filter_input_date_picker_view.dart';

class FilterInflateDateOperatorViews extends BaseConsumerWidget {
  const FilterInflateDateOperatorViews(
      {Key? key, required this.taskFilterDM, required this.index})
      : super(key: key);

  final TaskVariableFilterDM taskFilterDM;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: Dimens.spacing_12),
      padding: const EdgeInsets.only(
          left: Dimens.spacing_8,
          right: Dimens.spacing_4,
          top: Dimens.spacing_12,
          bottom: Dimens.spacing_12),
      decoration: const BoxDecoration(
          color: AppColor.grey9,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Dimens.size_25,
                    margin: const EdgeInsets.only(
                        left: Dimens.spacing_2, right: Dimens.spacing_2),
                    child: Text(
                      "${taskFilterDM.label}:",
                      style: AppTextStyles.mediumTextStyle(
                          fontSize: Dimens.font_11, textColor: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Dimens.size_25,
                      margin: const EdgeInsets.only(
                          left: Dimens.spacing_2,
                          top: Dimens.none,
                          right: Dimens.spacing_2),
                      child: Text(
                        Strings.taskListingLabelOperatorText,
                        style: AppTextStyles.mediumTextStyle(
                            fontSize: Dimens.font_10, textColor: Colors.black),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                        width: Dimens.size_120,
                        height: Dimens.size_33,
                        margin: const EdgeInsets.only(
                            left: Dimens.spacing_4,
                            top: Dimens.spacing_8,
                            right: Dimens.spacing_4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.radius_8)),
                            border: Border.all(color: Colors.grey, width: 1.0)),
                        child: taskFilterDM.enableEditing!
                            ? DropdownBelow(
                                itemWidth: Dimens.size_120,
                                isDense: false,
                                itemTextstyle: const TextStyle(
                                    fontSize: Dimens.font_13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                boxTextstyle: const TextStyle(
                                    fontSize: Dimens.font_13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                boxPadding: const EdgeInsets.fromLTRB(
                                    Dimens.spacing_8,
                                    Dimens.spacing_4,
                                    Dimens.spacing_2,
                                    Dimens.spacing_8),
                                boxWidth: Dimens.size_125,
                                boxHeight: Dimens.size_40,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColor.primaryColor,
                                  size: Dimens.size_20,
                                ),
                                // reversedIcon: const Icon(
                                //   Icons.keyboard_arrow_up_rounded,
                                //   color: AppColor.primarycolor,
                                //   size: Dimens.size_20,
                                // ),
                                onChanged: (selectedOperator) {
                                  ref
                                      .read(taskListViewModelProvider)
                                      .updateSelectedVariableFilterOperatorValue(
                                          taskFilterDM,
                                          index,
                                          selectedOperator!);
                                },
                                hint: const Text(
                                  Strings.taskListingLabelOperatorKey,
                                  style: TextStyle(
                                      fontSize: Dimens.font_13,
                                      color: AppColor.hintGrey),
                                ),
                                items: taskFilterDM.variableDropDownItems,
                                value: taskFilterDM.selectedOperatorLabel ?? "",
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: Text(
                                    taskFilterDM.selectedOperatorLabel != null
                                        ? taskFilterDM.selectedOperatorLabel!
                                        : "=",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.mediumTextStyle(
                                        fontSize: Dimens.font_13,
                                        textColor: Colors.black))))
                  ])),
          Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Dimens.size_25,
                    margin: const EdgeInsets.only(
                        left: Dimens.spacing_6, right: Dimens.spacing_2),
                    child: Text(
                      Strings.taskListingLabelValueText,
                      style: AppTextStyles.mediumTextStyle(
                          fontSize: Dimens.font_11, textColor: Colors.black),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: Dimens.spacing_6),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: FilterInputDatePickerView(
                              index: index, taskFilterDM: taskFilterDM)))
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.spacing_4, top: Dimens.spacing_35),
              child: taskFilterDM.filterSaved == true &&
                      !taskFilterDM.enableEditing!
                  ? InkWell(
                      onTap: () {
                        if (ref
                            .read(taskListViewModelProvider)
                            .validateProcessDefinitionFilter(
                                taskFilterDM, index)) {
                          ref
                              .read(taskListViewModelProvider)
                              .enableVariableFilterEditing(taskFilterDM, index);
                        }
                      },
                      child: const Icon(
                        Icons.edit,
                        color: AppColor.green2,
                        size: Dimens.size_25,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        if (ref
                            .read(taskListViewModelProvider)
                            .validateProcessDefinitionFilter(
                                taskFilterDM, index)) {
                          ref
                              .read(taskListViewModelProvider)
                              .saveSelectedVariableFilter(taskFilterDM, index);
                        } else {
                          showErrorToast(
                              context: context,
                              description:
                                  "Enter ${taskFilterDM.label} Values");
                        }
                      },
                      child: const Icon(
                        Icons.check_circle,
                        color: AppColor.green2,
                        size: Dimens.size_29,
                      ),
                    )),
          Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.spacing_6, top: Dimens.spacing_35),
              child: InkWell(
                onTap: () {
                  ref
                      .read(taskListViewModelProvider)
                      .deleteSelectedVariableFilter(taskFilterDM, index);
                },
                child: const Icon(
                  Icons.cancel_rounded,
                  color: AppColor.red,
                  size: Dimens.size_29,
                ),
              )),
        ],
      ),
    );
  }
}
