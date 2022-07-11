import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai/core/router/app_routes.dart';
import 'package:formsflowai_shared/core/base/base_hooks_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_status.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:formsflowai_shared/widgets/nodata/no_data_view.dart';
import 'package:formsflowai_shared/widgets/shimmer/shimmer_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timelines/timelines.dart';

import '../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../shared/app_text_styles.dart';
import '../../../../../shared/extensions/formsflowai_extensions.dart';
import '../../model/application_history_data_model.dart';

class TaskApplicationHistoryView extends BaseHooksConsumerWidget {
  const TaskApplicationHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showApplicationHistory = ref.watch(
        applicationHistoryTabViewModelProvider
            .select((value) => value.applicationPageStatus));

    final applicationList = ref
        .watch(applicationHistoryTabViewModelProvider)
        .applicationHistoryList;

    if (showApplicationHistory == PageStatus.failure) {
      return Container(
        alignment: Alignment.center,
        height: double.infinity,
        padding: const EdgeInsets.only(top: Dimens.spacing_4),
        child: Center(
            child: NoDataView(
          heading: Strings.taskDetailsErrorApplicationHistoryNotFound,
          description: Strings.taskDetailsErrorApplicationHistoryDescription,
        )),
      );
    } else if (showApplicationHistory == PageStatus.success) {
      return _buildHistoryTimeLineView(applicationList, ref);
    } else {
      return ShimmerWidgets.showShimmerListView();
    }
  }

  Widget _buildHistoryTimeLineView(
      List<ApplicationHistoryDM> list, WidgetRef ref) {
    return Container(
        color: AppColor.grey7,
        padding: const EdgeInsets.only(
            left: Dimens.spacing_32, right: Dimens.spacing_16),
        alignment: Alignment.topLeft,
        child: Timeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: AppColor.hint_grey2,
            connectorTheme: const ConnectorThemeData(
              thickness: 3.0,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            indicatorBuilder: (context, index) {
              return const DotIndicator(
                color: AppColor.primarycolor,
              );
            },
            connectorBuilder: (_, index, connectorType) {
              return SolidLineConnector(
                indent: connectorType == ConnectorType.start ? 0 : 1.0,
                endIndent: connectorType == ConnectorType.end ? 0 : 1.0,
                color: AppColor.primarycolor,
              );
            },
            contentsBuilder: (context, index) {
              return _returnTile(list[index], context, ref);
            },
            itemCount: list.length,
          ),
        ));
  }

  Widget _returnTile(
      ApplicationHistoryDM dm, BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
          top: Dimens.spacing_8, bottom: Dimens.spacing_8),
      margin: const EdgeInsets.only(left: Dimens.spacing_16),
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.spacing_8),
          ),
          child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
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
                                  flex: 5,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: Dimens.spacing_4,
                                          top: Dimens.spacing_12),
                                      child: Text(
                                        dm.applicationStatus?.toUpperCase() ??
                                            '',
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.boldTextStyle(
                                            fontSize: Dimens.font_13,
                                            textColor: Colors.black87),
                                      ))),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: Dimens.spacing_16,
                                          right: Dimens.spacing_8,
                                          top: Dimens.spacing_12),
                                      height: Dimens.size_30,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          RouterUtils.pushToRouteWithExtra(
                                              context: context,
                                              routeName: AppRoutes
                                                  .viewFormSubmissionScreen,
                                              extra: dm,
                                              params: {
                                                "formUrl": dm.formUrl ?? ''
                                              });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColor.blue3,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Dimens.spacing_20),
                                          ),
                                          elevation: Dimens.elevation_5,
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            Strings
                                                .taskDetailsButtonViewSubmission,
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyles.semiBoldTextStyle(
                                                    fontSize: Dimens.font_12,
                                                    textColor: Colors.white),
                                          ),
                                        ),
                                      ))),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimens.spacing_16,
                                top: Dimens.spacing_8,
                                bottom: Dimens.spacing_12),
                            child: Text(
                              dm.created != null && dm.created!.isNotEmpty
                                  ? dm.created!.getApplicationTime(
                                      text: Strings.taskListingLabelCreated,
                                      dateTime: dm.created!)
                                  : "",
                              style: AppTextStyles.mediumTextStyle(
                                  fontSize: Dimens.font_13,
                                  textColor: Colors.black87),
                            ),
                          ),
                        ],
                      ))
                ],
              ))),
    );
  }
}
