import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import 'package:formsflowai/shared/extensions/formsflowai_extensions.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/color_util.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/router/app_routes.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../../utils/general_util.dart';

class TaskListInflateRowView extends BaseConsumerWidget {
  const TaskListInflateRowView({
    Key? key,
    required this.dm,
    required this.index,
  }) : super(key: key);

  final TaskListingDM dm;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: dm.dueDate != null && dm.followUp != null
          ? Dimens.size_155
          : Dimens.size_140,
      padding: const EdgeInsets.only(
          left: Dimens.spacing_4,
          right: Dimens.spacing_4,
          top: Dimens.spacing_8,
          bottom: Dimens.spacing_8),
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
              onTap: () {
                RouterUtils.pushToRouteWithExtra(
                    context: context,
                    routeName: AppRoutes.taskDetailsScreen,
                    extra: dm,
                    params: {"taskId": dm.taskId ?? ''});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Dimens.size_7,
                    height: Dimens.size_140,
                    padding: const EdgeInsets.only(
                        top: Dimens.spacing_5,
                        bottom: Dimens.spacing_5,
                        left: Dimens.spacing_8),
                    decoration: BoxDecoration(
                      color: ColorUtil.getColor(dm.name ?? ''),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0)),
                    ),
                  ),
                  Expanded(
                      flex: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimens.spacing_8,
                                        top: Dimens.spacing_12),
                                    child: SvgPicture.asset(
                                      "assets/images/ic_task_eye.svg",
                                      width: Dimens.size_35,
                                    ),
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: Dimens.spacing_4,
                                          top: Dimens.spacing_12),
                                      child: Text(
                                        dm.name?.toUpperCase() ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.mediumTextStyle(
                                            fontSize: Dimens.font_12,
                                            textColor: AppColor.grey10),
                                      ))),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: Dimens.spacing_6,
                                                top: Dimens.spacing_12),
                                            child: Container(
                                              width: Dimens.size_7,
                                              height: Dimens.size_7,
                                              decoration: const BoxDecoration(
                                                  color: AppColor.green,
                                                  shape: BoxShape.circle),
                                            )),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                right: Dimens.spacing_8,
                                                top: Dimens.spacing_12),
                                            child: Text(
                                                Strings.taskListingLabelPriority
                                                        .toUpperCase() +
                                                    dm.priority.toString(),
                                                style: AppTextStyles
                                                    .mediumTextStyle(
                                                        fontSize:
                                                            Dimens.font_10,
                                                        textColor:
                                                            AppColor.grey10))),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: Dimens.spacing_16,
                                          top: Dimens.spacing_6),
                                      child: Text(
                                        !GeneralUtil.isStringEmpty(
                                                dm.processDefinitionName)
                                            ? dm.processDefinitionName!
                                            : Strings
                                                .taskListingLabelNoProcessDefinitionAvailable,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.semiBoldTextStyle(
                                            fontSize: Dimens.font_12,
                                            textColor: Colors.black),
                                      ))),
                              if (dm.assignee != null &&
                                  dm.assignee!.isNotEmpty)
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.topRight,
                                        margin: const EdgeInsets.only(
                                            left: Dimens.spacing_8,
                                            right: Dimens.spacing_8,
                                            top: Dimens.spacing_6),
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            text: Strings
                                                .taskListingLabelAssignee,
                                            style:
                                                AppTextStyles.regularTextStyle(
                                                    fontSize: Dimens.font_11,
                                                    textColor: AppColor.grey10),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: dm.assignee,
                                                  style: AppTextStyles
                                                      .regularTextStyle(
                                                          fontSize:
                                                              Dimens.font_11,
                                                          textColor:
                                                              Colors.black)),
                                            ],
                                          ),
                                        ))),
                            ],
                          ),
                          if (dm.dueDate != null)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: Dimens.spacing_16,
                                  top: Dimens.spacing_4),
                              child: Text(
                                dm.dueDate!.getTimeFromNow(
                                    text: Strings.taskListingLabelDueIn,
                                    dateTime: dm.dueDate!),
                                style: AppTextStyles.regularTextStyle(
                                    fontSize: Dimens.font_11,
                                    textColor: Colors.black),
                              ),
                            ),
                          if (dm.followUp != null)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: Dimens.spacing_16,
                                  top: Dimens.spacing_4),
                              child: Text(
                                dm.followUp!.getTimeFromNow(
                                    text: Strings.taskListingLabelFollowup,
                                    dateTime: dm.followUp!),
                                style: AppTextStyles.regularTextStyle(
                                    fontSize: Dimens.font_11,
                                    textColor: Colors.black),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimens.spacing_16,
                                top: Dimens.spacing_4,
                                bottom: Dimens.spacing_8),
                            child: Text(
                              dm.created != null
                                  ? dm.created!.getTimeFromNow(
                                      text: Strings.taskListingLabelCreated,
                                      dateTime: dm.created!)
                                  : Strings.generalLabelNoInfoAvailable,
                              style: AppTextStyles.regularTextStyle(
                                  fontSize: Dimens.font_11,
                                  textColor: Colors.black),
                            ),
                          ),
                        ],
                      ))
                ],
              ))),
    );
  }
}
