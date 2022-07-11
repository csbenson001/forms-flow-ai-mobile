import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai_shared/core/base/base_consumer_widget.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/app_font.dart';
import 'package:formsflowai_shared/shared/app_strings.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../../shared/app_text_styles.dart';

class AddedFilterCountView extends BaseConsumerWidget {
  const AddedFilterCountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedVariablesFiltersList =
        ref.watch(taskListViewModelProvider).selectedVariablesFiltersList;

    return Padding(
        padding: const EdgeInsets.only(
            top: Dimens.spacing_16, right: Dimens.spacing_2),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: Dimens.spacing_8, right: Dimens.spacing_8),
              child: Text(
                Strings.taskListingLabelTaskFiltered,
                style: AppTextStyles.semiBoldTextStyle(
                    fontSize: Dimens.font_12, textColor: Colors.black),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(
                    left: Dimens.spacing_6,
                    right: Dimens.spacing_6,
                    top: Dimens.spacing_2,
                    bottom: Dimens.spacing_2),
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColor.primarycolor,
                    borderRadius: BorderRadius.all(Radius.circular(6.0))),
                child: Text(
                  selectedVariablesFiltersList.length.toString(),
                  style: AppTextStyles.mediumTextStyle(
                      fontSize: Dimens.font_13, textColor: Colors.white),
                )),
            const Spacer(),
            Container(
              height: Dimens.size_30,
              margin: const EdgeInsets.only(
                  left: Dimens.spacing_8, right: Dimens.spacing_16),
              child: InkWell(
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(taskListViewModelProvider)
                        .clearAllSelectedVariableFilters();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: Dimens.elevation_2,
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: Dimens.spacing_4, right: Dimens.spacing_4),
                    alignment: Alignment.center,
                    child: const ClipRect(
                      child: Text(
                        Strings.taskListingButtonClearFilters,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Dimens.font_14,
                            color: Colors.white,
                            fontFamily: AppFont.FONT_MONTERSERAT,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
