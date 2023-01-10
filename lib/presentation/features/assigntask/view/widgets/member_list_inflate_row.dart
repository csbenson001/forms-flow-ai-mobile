import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai/presentation/features/assigntask/model/view_members_filter_data_model.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/app_text_styles.dart';
import '../../../../base/widgets/base_consumer_widget.dart';
import '../../model/memebers_data_model.dart';

/// [MemberListInflateRow] widget show member list inflate row
/// contains the member's name and the selection checkbox
class MemberListInflateRow extends BaseConsumerWidget {
  final MembersDM memberDM;
  final int index;
  final ViewMembersFilterDM viewMembersFilterModel;

  const MemberListInflateRow(
      {Key? key,
      required this.memberDM,
      required this.index,
      required this.viewMembersFilterModel})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          ref
              .read(assignTaskViewModelProvider)
              .onMemberItemSelected(memberDM, index);
        },
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimens.spacing_12,
              left: Dimens.spacing_16,
              right: Dimens.spacing_16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text(
                ViewMembersFilterDM.getDisplayText(
                    memberDM, viewMembersFilterModel),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: memberDM.isSelected ?? false
                    ? AppTextStyles.blueMediumTextStyleWithHeight
                    : AppTextStyles.blackRegularTextStyleWithHeight_14,
              )),
              Padding(
                padding: const EdgeInsets.only(
                    right: Dimens.spacing_16, left: Dimens.spacing_24),
                child: SvgPicture.asset(
                  memberDM.isSelected ?? false
                      ? "assets/images/ic_circle_check.svg"
                      : "assets/images/ic_circle_uncheck.svg",
                  color: memberDM.isSelected ?? false
                      ? AppColor.primaryColor
                      : Colors.grey,
                  width: Dimens.size_24,
                  height: Dimens.size_24,
                ),
              )
            ],
          ),
        ));
  }
}
