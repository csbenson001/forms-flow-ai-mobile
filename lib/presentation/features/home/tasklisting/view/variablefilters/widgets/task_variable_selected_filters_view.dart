import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../../shared/imageassets/formsflowai_image_assets.dart';
import '../../../../../../base/widgets/base_consumer_widget.dart';
import '../../../model/task_selected_variables_count_data_model.dart';

class TaskVariableSelectedFiltersView extends BaseConsumerWidget {
  const TaskVariableSelectedFiltersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedVariablesList =
        ref.watch(taskListViewModelProvider).selectedVariablesFiltersList;
    final uiVariablesList =
        ref.watch(taskListViewModelProvider).uiVariablesFiltersList;

    return Row(
      children: [
        Expanded(
          flex: 90,
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: Dimens.none,
            runAlignment: WrapAlignment.start,
            runSpacing: Dimens.none,
            crossAxisAlignment: WrapCrossAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: getVariableSelectedWrapItems(
                TaskSelectedVariablesCountDM.transform(
                    uiVariablesList, selectedVariablesList)),
          ),
        ),
        Flexible(
            flex: 10,
            child: Padding(
                padding: const EdgeInsets.only(
                    top: Dimens.spacing_2, left: Dimens.spacing_10),
                child: SvgPicture.asset(
                  FormsFlowAIImageAssets.imagesFilter,
                  width: Dimens.size_26,
                  height: Dimens.size_26,
                )))
      ],
    );
  }

  List<Widget> getVariableSelectedWrapItems(
      List<TaskSelectedVariablesCountDM> selectedVariablesList) {
    List<Widget> list = List.empty(growable: true);
    for (var index = 0; index < selectedVariablesList.length; index++) {
      list.add(inflateVariableFilterRow(selectedVariablesList[index], index));
    }
    return list;
  }

  Widget inflateVariableFilterRow(TaskSelectedVariablesCountDM dm, int index) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: const EdgeInsets.only(
                  left: Dimens.spacing_8, top: Dimens.spacing_8),
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
                      BorderRadius.all(Radius.circular(Dimens.spacing_10)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                          left: Dimens.spacing_10,
                          right: Dimens.spacing_10,
                          top: Dimens.spacing_10,
                          bottom: Dimens.spacing_10),
                      child: Text(
                        dm.label!,
                        style: AppTextStyles.semiBoldTextStyle(
                            fontSize: Dimens.font_12, textColor: Colors.black),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          left: Dimens.spacing_4,
                          right: Dimens.spacing_4,
                          top: Dimens.spacing_6),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(Dimens.spacing_6),
                        color: AppColor.primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: Dimens.spacing_8,
                            right: Dimens.spacing_8,
                            top: Dimens.spacing_4,
                            bottom: Dimens.spacing_4),
                        child: Text(
                          dm.count!.toString(),
                          style: AppTextStyles.boldTextStyle(
                              fontSize: Dimens.font_12,
                              textColor: Colors.white),
                        ),
                      )),
                ],
              )),
        ]);
  }
}
