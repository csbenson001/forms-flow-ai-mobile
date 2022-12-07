import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/module/providers/view_model_provider.dart';
import '../../../../../../shared/app_strings.dart';
import '../../../../../../shared/app_text_styles.dart';
import '../../../../../base/widgets/base_consumer_widget.dart';

class AddGroupButton extends BaseConsumerWidget {
  const AddGroupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch for group name changes =
    final groupName =
        ref.watch(addGroupViewModelProvider.select((value) => value.groupName));

    return groupName.isNotEmpty
        ? Container(
            alignment: Alignment.topRight,
            width: Dimens.size_120,
            margin: const EdgeInsets.only(
                left: Dimens.spacing_8,
                top: Dimens.spacing_8,
                right: Dimens.spacing_18),
            padding: const EdgeInsets.only(left: Dimens.spacing_4),
            decoration: const ShapeDecoration(
              color: AppColor.primarycolor,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.radius_10)),
              ),
            ),
            child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  ref.read(addGroupViewModelProvider).onClickAddGroupButton();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          top: Dimens.spacing_8, bottom: Dimens.spacing_8),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: Dimens.size_20,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.spacing_8,
                            bottom: Dimens.spacing_8,
                            left: Dimens.spacing_4),
                        child: Text(
                          Strings.taskDetailsButtonAddGroup,
                          style: AppTextStyles.semiBoldTextStyle(
                              fontSize: Dimens.font_12,
                              textColor: Colors.white),
                        )),
                  ],
                )))
        : Container(
            alignment: Alignment.topRight,
            width: Dimens.size_120,
            margin: const EdgeInsets.only(
                left: Dimens.spacing_8,
                top: Dimens.spacing_8,
                right: Dimens.spacing_18),
            padding: const EdgeInsets.only(left: Dimens.spacing_4),
            decoration: const ShapeDecoration(
              color: Colors.black54,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.radius_10)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      top: Dimens.spacing_8, bottom: Dimens.spacing_8),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: Dimens.size_20,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: Dimens.spacing_8,
                        bottom: Dimens.spacing_8,
                        left: Dimens.spacing_4),
                    child: Text(
                      Strings.taskDetailsButtonAddGroup,
                      style: AppTextStyles.semiBoldTextStyle(
                          fontSize: Dimens.font_12, textColor: Colors.white),
                    )),
              ],
            ));
  }
}
