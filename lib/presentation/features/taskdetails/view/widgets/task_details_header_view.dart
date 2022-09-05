import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import 'package:formsflowai/presentation/features/taskdetails/viewmodel/task_details_providers.dart';
import 'package:formsflowai_api/response/task/details/task_group_response.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/shared/formsflow_app_constants.dart';
import 'package:formsflowai_shared/widgets/nointernetview/no_internet_snackbar_view.dart';
import 'package:formsflowai_shared/widgets/shimmer/shimmer_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/app_text_styles.dart';
import '../../../../../shared/imageassets/formsflowai_image_assets.dart';
import '../../../../../utils/general_util.dart';

class TaskDetailsHeaderView extends BaseConsumerWidget {
  const TaskDetailsHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskInfoDM = ref.watch(
        taskDetailsViewModelProvider.select((value) => value.taskInfoDM));
    final TaskListingDM? taskListingDM = ref.watch(
        taskDetailsViewModelProvider.select((value) => value.taskListingDM));
    final taskGroupsList =
        ref.watch(taskDetailsViewModelProvider).taskGroupsList;
    final showTaskInfo = ref.watch(showTaskInfoProvider);

    return showTaskInfo
        ? Padding(
            padding: const EdgeInsets.only(bottom: Dimens.spacing_16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NoInternetTopSnackBarView(),
                Padding(
                    padding: const EdgeInsets.only(
                        top: Dimens.spacing_16,
                        left: Dimens.spacing_16,
                        right: Dimens.spacing_16),
                    child: Text(
                      taskInfoDM.taskName ?? '',
                      style: AppTextStyles.semiBoldTextStyle(
                          fontSize: Dimens.font_16, textColor: Colors.black),
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        top: Dimens.spacing_8,
                        left: Dimens.spacing_16,
                        right: Dimens.spacing_16),
                    child: Text(
                      "${Strings.taskDetailsLabelApplicationId} ${taskInfoDM.applicationId?.toString()}",
                      style: AppTextStyles.semiBoldTextStyle(
                          fontSize: Dimens.font_16, textColor: Colors.black),
                    )),
                Container(
                    margin: const EdgeInsets.only(
                        top: Dimens.spacing_12,
                        left: Dimens.spacing_16,
                        right: Dimens.spacing_16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: Dimens.spacing_none),
                            child: Text(
                              taskInfoDM.created != null
                                  ? Strings.taskDetailsLabelCreated +
                                      Jiffy(
                                              taskInfoDM.created!,
                                              FormsFlowAIConstants
                                                  .dateYearTimeStampTFormat)
                                          .fromNow()
                                  : Strings.generalLabelNoInfoAvailable,
                              style: AppTextStyles.semiBoldTextStyle(
                                  fontSize: Dimens.font_12,
                                  textColor: Colors.black),
                            )),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.spacing_16,
                      right: Dimens.spacing_16,
                      top: Dimens.spacing_16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(taskDetailsViewModelProvider)
                                .showDateTimePicker(
                                    dateSelectorType:
                                        TaskDetailsDateSelectorType.dueDate,
                                    context: context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColor.grey4, width: 0.75),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(Dimens.spacing_6)),
                                shape: BoxShape.rectangle,
                              ),
                              padding: const EdgeInsets.only(
                                  left: Dimens.spacing_8,
                                  right: Dimens.spacing_8,
                                  top: Dimens.spacing_8,
                                  bottom: Dimens.spacing_8),
                              child: taskListingDM?.dueDate != null
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Text(
                                            Strings.taskDetailsLabelDuein +
                                                Jiffy(
                                                        taskListingDM?.dueDate,
                                                        FormsFlowAIConstants
                                                            .dateYearTimeStampTFormat)
                                                    .fromNow(),
                                            style:
                                                AppTextStyles.regularTextStyle(
                                                    fontSize: Dimens.font_11,
                                                    textColor: Colors.black),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: Dimens.spacing_2),
                                                child: InkWell(
                                                  onTap: () {
                                                    ref
                                                        .read(
                                                            taskDetailsViewModelProvider)
                                                        .onRemovedTaskDate(
                                                            dateSelectorType:
                                                                TaskDetailsDateSelectorType
                                                                    .dueDate);
                                                  },
                                                  child: SvgPicture.asset(
                                                    FormsFlowAIImageAssets
                                                        .imagesCloseFilled,
                                                    width: Dimens.size_16,
                                                    height: Dimens.size_16,
                                                    color: AppColor.red,
                                                  ),
                                                ))),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            Strings.taskDetailsLabelSetDueDate,
                                            style:
                                                AppTextStyles.regularTextStyle(
                                                    fontSize: Dimens.font_13,
                                                    textColor: Colors.black),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: SizerUtil.deviceType ==
                                                          DeviceType.mobile
                                                      ? Dimens.spacing_2
                                                      : Dimens.spacing_10,
                                                  right: SizerUtil.deviceType ==
                                                          DeviceType.mobile
                                                      ? Dimens.spacing_2
                                                      : Dimens.spacing_none,
                                                ),
                                                child: const Icon(
                                                  Icons.calendar_today_sharp,
                                                  size: 16.0,
                                                  color: AppColor.primarycolor,
                                                )))
                                      ],
                                    )),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: Dimens.spacing_4,
                                right: Dimens.spacing_2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppColor.grey4, width: 0.75),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(Dimens.spacing_6)),
                              shape: BoxShape.rectangle,
                            ),
                            padding: const EdgeInsets.only(
                                left: Dimens.spacing_8,
                                right: Dimens.spacing_8,
                                top: Dimens.spacing_8,
                                bottom: Dimens.spacing_8),
                            child: InkWell(
                                onTap: () {
                                  ref
                                      .read(taskDetailsViewModelProvider)
                                      .showDateTimePicker(
                                          dateSelectorType:
                                              TaskDetailsDateSelectorType
                                                  .followupDate,
                                          context: context);
                                },
                                child: taskListingDM?.followUp != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 8,
                                            child: Text(
                                              Strings.taskDetailsLabelFollowup +
                                                  Jiffy(
                                                          taskListingDM
                                                              ?.followUp!,
                                                          FormsFlowAIConstants
                                                              .dateYearTimeStampTFormat)
                                                      .fromNow(),
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles
                                                  .regularTextStyle(
                                                      fontSize: Dimens.font_11,
                                                      textColor: Colors.black),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left:
                                                              Dimens.spacing_2),
                                                  child: InkWell(
                                                    onTap: () {
                                                      ref
                                                          .read(
                                                              taskDetailsViewModelProvider)
                                                          .onRemovedTaskDate(
                                                              dateSelectorType:
                                                                  TaskDetailsDateSelectorType
                                                                      .followupDate);
                                                    },
                                                    child: SvgPicture.asset(
                                                      FormsFlowAIImageAssets
                                                          .imagesCloseFilled,
                                                      width: Dimens.size_16,
                                                      height: Dimens.size_16,
                                                      color: AppColor.red,
                                                    ),
                                                  ))),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 9,
                                            child: Text(
                                              Strings
                                                  .taskDetailsLabelSetFollowupDate,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles
                                                  .regularTextStyle(
                                                      fontSize: Dimens.font_13,
                                                      textColor: Colors.black),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                  padding: SizerUtil
                                                              .deviceType ==
                                                          DeviceType.mobile
                                                      ? const EdgeInsets.only(
                                                          left:
                                                              Dimens.spacing_2,
                                                          right:
                                                              Dimens.spacing_2)
                                                      : const EdgeInsets.only(
                                                          left:
                                                              Dimens.spacing_10,
                                                          right: Dimens
                                                              .spacing_none),
                                                  child: const Icon(
                                                    Icons.calendar_today_sharp,
                                                    size: Dimens.size_16,
                                                    color:
                                                        AppColor.primarycolor,
                                                  )))
                                        ],
                                      )),
                          ))
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                        left: Dimens.spacing_16,
                        right: Dimens.spacing_16,
                        top: Dimens.spacing_24),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 5,
                              child: InkWell(
                                  onTap: () {
                                    ref
                                        .read(taskDetailsViewModelProvider)
                                        .showAddGroupDialog(context: context);
                                  },
                                  child: Container(
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      color: AppColor.primarycolor,
                                      border: Border.all(
                                          color: AppColor.grey4, width: 0.75),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(Dimens.spacing_16)),
                                      shape: BoxShape.rectangle,
                                    ),
                                    padding: const EdgeInsets.only(
                                        left: Dimens.spacing_8,
                                        right: Dimens.spacing_8,
                                        top: Dimens.spacing_8,
                                        bottom: Dimens.spacing_8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: Dimens.spacing_8),
                                            child: SvgPicture.asset(
                                              FormsFlowAIImageAssets
                                                  .imagesIcGroup,
                                              color: Colors.white,
                                              width: Dimens.size_12,
                                              height: Dimens.size_12,
                                            )),
                                        Flexible(
                                            child: Text(
                                          taskGroupsList.isEmpty
                                              ? Strings
                                                  .taskDetailsLabelManageGroups
                                              : TaskGroupsResponse.getGroupList(
                                                  data: taskGroupsList),
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              AppTextStyles.semiBoldTextStyle(
                                                  fontSize: Dimens.font_11_5,
                                                  textColor: Colors.white),
                                        )),
                                      ],
                                    ),
                                  ))),
                          Container(
                              alignment: Alignment.topRight,
                              margin:
                                  const EdgeInsets.only(left: Dimens.spacing_4),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    (!GeneralUtil.isStringEmpty(
                                            taskListingDM?.assignee ?? ''))
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                                Align(
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: Dimens
                                                                  .spacing_16),
                                                      decoration:
                                                          ShapeDecoration(
                                                        shadows: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.4),
                                                            offset:
                                                                const Offset(
                                                                    4, 4),
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                        color: Colors.white,
                                                        shape:
                                                            const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      Dimens
                                                                          .spacing_10)),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                ref
                                                                    .read(
                                                                        taskDetailsViewModelProvider)
                                                                    .onClickAssignTaskButton(
                                                                        context:
                                                                            context);
                                                              },
                                                              child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: Dimens
                                                                          .spacing_10,
                                                                      right: Dimens
                                                                          .spacing_10,
                                                                      top: Dimens
                                                                          .spacing_10,
                                                                      bottom: Dimens
                                                                          .spacing_10),
                                                                  child:
                                                                      AutoSizeText(
                                                                    taskListingDM
                                                                            ?.assignee ??
                                                                        '',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: AppTextStyles.mediumTextStyle(
                                                                        fontSize:
                                                                            Dimens
                                                                                .font_12,
                                                                        textColor:
                                                                            Colors.black),
                                                                    minFontSize:
                                                                        Dimens
                                                                            .font_10,
                                                                    maxFontSize:
                                                                        Dimens
                                                                            .font_12,
                                                                    softWrap:
                                                                        true,
                                                                  ))),
                                                          InkWell(
                                                              onTap: () {
                                                                ref
                                                                    .read(
                                                                        taskDetailsViewModelProvider)
                                                                    .unClaimTask();
                                                              },
                                                              child: Container(
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      left: Dimens
                                                                          .spacing_4,
                                                                      right: Dimens
                                                                          .spacing_4,
                                                                      top: Dimens
                                                                          .spacing_8),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: Dimens
                                                                            .spacing_2,
                                                                        right: Dimens
                                                                            .spacing_2),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      FormsFlowAIImageAssets
                                                                          .imagesCloseFilled,
                                                                      width: Dimens
                                                                          .size_16,
                                                                      height: Dimens
                                                                          .size_16,
                                                                      color: AppColor
                                                                          .red,
                                                                    ),
                                                                  ))),
                                                        ],
                                                      )),
                                                ),
                                              ])
                                        : InkWell(
                                            onTap: () {
                                              ref
                                                  .read(
                                                      taskDetailsViewModelProvider)
                                                  .claimTask();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColor.primarycolor,
                                                border: Border.all(
                                                    color: AppColor.grey4,
                                                    width: 0.75),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(
                                                            Dimens.spacing_16)),
                                                shape: BoxShape.rectangle,
                                              ),
                                              padding: const EdgeInsets.only(
                                                  left: Dimens.spacing_8,
                                                  right: Dimens.spacing_8,
                                                  top: Dimens.spacing_8,
                                                  bottom: Dimens.spacing_8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: Dimens
                                                                  .spacing_8),
                                                      child: SvgPicture.asset(
                                                        "assets/images/ic_claim_task.svg",
                                                        color: Colors.white,
                                                        width: Dimens.size_12,
                                                        height: Dimens.size_12,
                                                      )),
                                                  Text(
                                                    Strings
                                                        .taskDetailsLabelClaimTask,
                                                    style: AppTextStyles
                                                        .semiBoldTextStyle(
                                                            fontSize:
                                                                Dimens.font_12,
                                                            textColor:
                                                                Colors.white),
                                                  ),
                                                ],
                                              ),
                                            )),
                                  ])),
                        ])),
              ],
            ),
          )
        : _showNoDataOrLoadingHeaderViews();
  }

  Widget _showNoDataOrLoadingHeaderViews() {
    return Container(
      margin: const EdgeInsets.only(
          bottom: Dimens.spacing_16, top: Dimens.spacing_16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidgets.getShimmerContainer(
              margin: const EdgeInsets.only(
                  top: Dimens.spacing_16, left: Dimens.spacing_8),
              padding: const EdgeInsets.all(Dimens.spacing_8),
              width: Dimens.size_100,
              height: Dimens.size_20,
              borderRadius:
                  const BorderRadius.all(Radius.circular(Dimens.spacing_8))),
          ShimmerWidgets.getShimmerContainer(
              margin: const EdgeInsets.only(
                  top: Dimens.spacing_8, left: Dimens.spacing_8),
              padding: const EdgeInsets.all(Dimens.spacing_8),
              width: Dimens.size_100,
              height: Dimens.size_20,
              borderRadius:
                  const BorderRadius.all(Radius.circular(Dimens.spacing_8))),
          Container(
              margin: const EdgeInsets.only(
                  top: Dimens.spacing_12, left: Dimens.spacing_8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidgets.getShimmerContainer(
                      margin: const EdgeInsets.only(
                          top: Dimens.spacing_none, left: Dimens.spacing_none),
                      padding: const EdgeInsets.all(Dimens.spacing_8),
                      width: Dimens.size_100,
                      height: Dimens.size_20,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.spacing_8))),
                  const Spacer(),
                  ShimmerWidgets.getShimmerContainer(
                      margin: const EdgeInsets.only(
                          right: Dimens.spacing_8, left: Dimens.spacing_8),
                      padding: const EdgeInsets.all(Dimens.spacing_8),
                      width: Dimens.size_100,
                      height: Dimens.size_20,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.spacing_8))),
                ],
              ))
        ],
      ),
    );
  }
}
