import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai_api/response/task/details/task_group_response.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../shared/app_text_styles.dart';
import '../../../../../../shared/imageassets/formsflowai_image_assets.dart';

class AddGroupsListView extends BaseConsumerWidget {
  const AddGroupsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch for group list changes in view model
    final groupList = ref.watch(taskDetailsViewModelProvider).taskGroupsList;

    return Padding(
        padding: const EdgeInsets.only(
            top: Dimens.spacing_16,
            bottom: Dimens.spacing_16,
            right: Dimens.spacing_16,
            left: Dimens.spacing_16),
        child: ListView.separated(
          primary: false,
          itemCount: groupList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return itemInflateGroupListRow(groupList[index], context, ref);
          },
          separatorBuilder: (context, index) {
            return const Padding(
                padding: EdgeInsets.only(top: Dimens.spacing_16));
          },
        ));
  }

  Widget itemInflateGroupListRow(
      TaskGroupsResponse taskList, BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
            padding: const EdgeInsets.only(
                left: Dimens.spacing_8,
                top: Dimens.spacing_10,
                bottom: Dimens.spacing_10),
            margin: const EdgeInsets.symmetric(horizontal: Dimens.spacing_8),
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
                    BorderRadius.all(Radius.circular(Dimens.radius_10)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    taskList.groupId ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.mediumTextStyle(
                        fontSize: Dimens.font_12, textColor: Colors.black),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          ref
                              .read(addGroupViewModelProvider)
                              .onClickDeleteGroupButton(taskList);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.spacing_4, right: Dimens.spacing_8),
                          child: SvgPicture.asset(
                            FormsFlowAIImageAssets.imagesCloseFilled,
                            width: Dimens.size_16,
                            height: Dimens.size_16,
                            color: AppColor.red,
                          ),
                        ))),
              ],
            )));
  }
}
