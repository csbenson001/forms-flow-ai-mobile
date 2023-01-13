import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../../../core/api/response/filter/filters_response.dart';
import '../../../../../../../../shared/app_text_styles.dart';
import '../../../../../../../base/widgets/base_consumer_widget.dart';
import '../../../../viewmodel/task_list_screen_providers.dart';

/// [TaskFilterBottomSheetListView] to display task filter list view
class TaskFilterBottomSheetListView extends BaseConsumerWidget {
  const TaskFilterBottomSheetListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<FiltersResponse> filterItems = ref.watch(filtersListProvider);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filterItems.length,
      controller: ModalScrollController.of(context),
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return _TaskFilterBottomSheetListItem(
            filtersResponse: filterItems[index], index: index);
      },
    );
  }
}

class _TaskFilterBottomSheetListItem extends BaseConsumerWidget {
  final FiltersResponse filtersResponse;
  final int index;

  const _TaskFilterBottomSheetListItem(
      {required this.filtersResponse, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(Dimens.spacing_16),
          child: Row(
            children: [
              Text(
                filtersResponse.name ?? '',
                style: AppTextStyles.semiBoldTextStyle(
                    fontSize: Dimens.font_16,
                    textColor: filtersResponse.isSelected
                        ? AppColor.primaryColor
                        : Colors.black),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: Dimens.spacing_16),
                child: SvgPicture.asset(
                  filtersResponse.isSelected
                      ? "assets/images/ic_circle_check.svg"
                      : "assets/images/ic_circle_uncheck.svg",
                  color: filtersResponse.isSelected
                      ? AppColor.primaryColor
                      : Colors.grey,
                  width: Dimens.spacing_24,
                  height: Dimens.spacing_24,
                ),
              )
            ],
          ),
        ));
  }
}
