import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai/presentation/features/taskdetails/view/addgroups/widgets/add_group_button.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/app_strings.dart';
import '../../../../../shared/app_text_styles.dart';
import '../../../../base/widgets/base_consumer_widget.dart';
import 'widgets/add_group_list_view.dart';

class AddGroupDialog extends BaseConsumerWidget {
  const AddGroupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch for group list changes in view model
    final groupList = ref.watch(taskDetailsViewModelProvider).taskGroupsList;

    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(
          top: Dimens.spacing_55,
          bottom: Dimens.spacing_30,
          left: Dimens.spacing_16,
          right: Dimens.spacing_16),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimens.radius_30),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                offset: Offset(Dimens.offset_none, Dimens.offset_10),
                blurRadius: Dimens.radius_10),
          ]),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: Dimens.elevation_5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          ref
                              .read(addGroupViewModelProvider)
                              .onClickCloseGroupPageButton(context: context);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: Dimens.spacing_16,
                                top: Dimens.spacing_24,
                                right: Dimens.spacing_32,
                                bottom: Dimens.spacing_16),
                            child: const Icon(
                              Icons.close,
                              size: Dimens.size_20,
                              color: Colors.black,
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: Dimens.spacing_6),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            Strings.taskDetailsLabelManageGroups,
                            style: AppTextStyles.semiBoldTextStyle(
                                fontSize: Dimens.font_18,
                                textColor: AppColor.primarycolor),
                          ),
                        )),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: Dimens.spacing_16,
                    left: Dimens.spacing_16,
                    right: Dimens.spacing_16),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    Strings.taskDetailsLabelAddGroups,
                    style: AppTextStyles.regularTextStyle(
                        fontSize: Dimens.font_12, textColor: Colors.black),
                  ),
                )),
            const Align(
              alignment: Alignment.topRight,
              child: AddGroupButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.spacing_20,
                  right: Dimens.spacing_20,
                  top: Dimens.spacing_16,
                  bottom: Dimens.spacing_16),
              child: SizedBox(
                  height: Dimens.size_50,
                  child: TextFormField(
                    controller: ref
                        .read(addGroupViewModelProvider)
                        .groupNameTextController,
                    onChanged: (value) {
                      ref
                          .read(addGroupViewModelProvider)
                          .updateGroupName(value: value);
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: Strings.taskDetailsHintGroupName,
                        hintStyle: AppTextStyles.mediumTextStyle(
                            fontSize: Dimens.font_12,
                            textColor: Colors.black54)),
                  )),
            ),
            Visibility(
              visible: groupList.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.spacing_20, top: Dimens.spacing_8),
                child: Text(
                  "${Strings.taskDetailsLabelGroups}(${groupList.length})",
                  style: AppTextStyles.semiBoldTextStyle(
                      fontSize: Dimens.font_16, textColor: Colors.black),
                ),
              ),
            ),
            const AddGroupsListView(),
          ],
        ),
      ),
    );
  }
}
