import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:formsflowai/presentation/features/assigntask/viewmodel/assign_task_state_notifier.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/widgets/dropdown/dropdown_below.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/app_text_styles.dart';

/// [ViewMembersFilterDropDownView] widget to show the available
/// filter dropdown values
class ViewMembersFilterDropDownView extends BaseConsumerWidget {
  const ViewMembersFilterDropDownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch for the selected member changes
    final memberFilterItems =
        ref.watch(assignTaskViewModelProvider).memberDropdownList;
    // Watch for the members list changes
    final membersList =
        ref.watch(assignTaskStateProvider.select((value) => value.membersList));
    // Watch for selected member filter
    final selectedMemberFilter = ref.watch(
        assignTaskStateProvider.select((value) => value.selectedMemberFilter));

    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(
                left: Dimens.spacing_20,
                top: Dimens.spacing_16,
                right: Dimens.spacing_4),
            child: Row(
              children: [
                Text(
                  membersList.isEmpty
                      ? Strings.assignLabelNoMembersAvailable
                      : "${Strings.assignLabelMembers} (${membersList.length.toString()})",
                  style: AppTextStyles.boldTextStyle(
                      fontSize: Dimens.font_16, textColor: Colors.black87),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(
                      left: Dimens.spacing_24, right: Dimens.spacing_24),
                  decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(4, 4),
                        blurRadius: 6.0,
                      ),
                    ],
                    color: Colors.white,
                    shape: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimens.radius_10)),
                    ),
                  ),
                  child: DropdownBelow(
                    itemWidth: Dimens.size_125,
                    isDense: false,
                    itemTextstyle: const TextStyle(
                        fontSize: Dimens.font_12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    boxTextstyle: const TextStyle(
                        fontSize: Dimens.font_12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    boxPadding: const EdgeInsets.fromLTRB(8, 4, 4, 8),
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
                    onChanged: (selectedItem) {
                      ref
                          .read(assignTaskViewModelProvider)
                          .onChangeDropdownTests(selectedItem);
                    },
                    items: memberFilterItems,
                    value: selectedMemberFilter,
                    hint: Text(selectedMemberFilter.title ?? ''),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
