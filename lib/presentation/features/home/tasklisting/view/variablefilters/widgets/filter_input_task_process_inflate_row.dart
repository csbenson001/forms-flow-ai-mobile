import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/custom_text_formfield.dart';
import 'package:formsflowai_shared/widgets/dropdown/dropdown_below.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../model/task_variable_filter_data_model.dart';

class FilterInflateTaskProcessView extends BaseConsumerWidget {
  const FilterInflateTaskProcessView(
      {Key? key, required this.filterDM, required this.index})
      : super(key: key);

  final TaskVariableFilterDM filterDM;
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
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Dimens.size_25,
                    margin: const EdgeInsets.only(
                        left: Dimens.spacing_2, right: Dimens.spacing_2),
                    child: Text(
                      "${filterDM.label}:",
                      style: AppTextStyles.mediumTextStyle(
                          fontSize: Dimens.font_11, textColor: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: Dimens.spacing_4,
                        right: Dimens.spacing_2,
                        top: Dimens.spacing_8),
                    child: CustomTextFormField(
                      initialValue: filterDM.selectedVariableProperty ?? "",
                      onChanged: (property) {
                        ref
                            .read(taskListViewModelProvider)
                            .updateSelectedVariableProperty(
                                filterDM, index, property);
                      },
                      enabled: filterDM.enableEditing,
                      hint: Strings.taskListingHintProperty,
                      textInputAction: TextInputAction.done,
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Dimens.size_25,
                      margin: const EdgeInsets.only(
                          left: Dimens.spacing_2,
                          top: Dimens.spacing_none,
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
                        width: Dimens.size_55,
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
                        child: filterDM.enableEditing!
                            ? DropdownBelow(
                                itemWidth: Dimens.size_60,
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
                                  color: AppColor.primarycolor,
                                  size: Dimens.size_20,
                                ),
                                reversedIcon: const Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color: AppColor.primarycolor,
                                  size: Dimens.size_20,
                                ),
                                onChanged: (selectedOperator) {
                                  ref
                                      .read(taskListViewModelProvider)
                                      .updateSelectedVariableFilterOperatorValue(
                                          filterDM, index, selectedOperator!);
                                },
                                hint: const Text(
                                  Strings.taskListingLabelOperatorKey,
                                  style: TextStyle(
                                      fontSize: Dimens.font_13,
                                      color: AppColor.hint_grey),
                                ),
                                items: filterDM.variableDropDownItems,
                                value: filterDM.selectedOperatorLabel ?? "",
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: Text(
                                    filterDM.selectedOperatorLabel != null
                                        ? filterDM.selectedOperatorLabel!
                                        : "=",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.mediumTextStyle(
                                        fontSize: Dimens.font_13,
                                        textColor: Colors.black))))
                  ])),
          Expanded(
              flex: 3,
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
                  Container(
                    margin: const EdgeInsets.only(
                        left: Dimens.spacing_8,
                        right: Dimens.spacing_4,
                        top: Dimens.spacing_8),
                    child: CustomTextFormField(
                      initialValue: filterDM.selectedVariableValue ?? "",
                      onChanged: (value) {
                        ref
                            .read(taskListViewModelProvider)
                            .updateSelectedVariableValue(
                                filterDM, index, value);
                      },
                      hint: Strings.taskListingHintValue,
                      enabled: filterDM.enableEditing,
                      textInputAction: TextInputAction.done,
                    ),
                  )
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.spacing_4, top: Dimens.spacing_35),
              child: filterDM.filterSaved == true && !filterDM.enableEditing!
                  ? InkWell(
                      onTap: () {
                        if (ref
                            .read(taskListViewModelProvider)
                            .validateVariableFilterContainer(filterDM, index)) {
                          ref
                              .read(taskListViewModelProvider)
                              .enableVariableFilterEditing(filterDM, index);
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
                            .validateVariableFilterContainer(filterDM, index)) {
                          ref
                              .read(taskListViewModelProvider)
                              .saveSelectedVariableFilter(filterDM, index);
                        } else {
                          showErrorToast(
                              context: context,
                              description: "Enter ${filterDM.label} Values");
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
                      .deleteSelectedVariableFilter(filterDM, index);
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
