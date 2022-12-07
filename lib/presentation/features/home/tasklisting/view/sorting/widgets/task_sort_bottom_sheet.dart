import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/sorting/widgets/task_sort_bottom_sheet_list_view.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:formsflowai_shared/utils/router/router_utils.dart';
import 'package:formsflowai_shared/widgets/button/customfilledbutton.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_strings.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../base/widgets/base_consumer_widget.dart';

/// [TaskSortBottomSheetView] to build a bottom sheet for displaying
/// sort filters
class TaskSortBottomSheetView extends BaseConsumerWidget {
  const TaskSortBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          leading: InkWell(
              onTap: () {
                RouterUtils.popRoute(context: context);
              },
              child: const Icon(
                Icons.close,
                color: Colors.black,
              )),
          middle: Text(
            Strings.taskListingLabelSortBy,
            style: AppTextStyles.boldTextStyle(
                fontSize: Dimens.font_16, textColor: Colors.black87),
          )),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: Dimens.spacing_80),
              child: TaskSortBottomSheetListView(),
            ),
            Positioned(
                bottom: Dimens.spacing_16,
                left: Dimens.spacing_50,
                right: Dimens.spacing_50,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        alignment: Alignment.center,
                        height: Dimens.size_50,
                        child: CustomFilledButton(
                          onPressed: () {
                            ref
                                .read(taskListViewModelProvider)
                                .addSortItemToList();
                            RouterUtils.popRoute(context: context);
                          },
                          buttonText:
                              Strings.generalButtonConfirm.toUpperCase(),
                          margin: const EdgeInsets.only(
                              left: Dimens.spacing_16,
                              right: Dimens.spacing_16,
                              bottom: Dimens.spacing_16),
                        ))))
          ],
        ),
      ),
    );
  }
}
