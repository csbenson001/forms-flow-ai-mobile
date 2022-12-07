import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formsflowai_shared/shared/dimens.dart';

import '../../../../../../../shared/app_strings.dart';
import '../../../../../../../shared/app_text_styles.dart';
import '../../../../../../../shared/imageassets/formsflowai_image_assets.dart';
import '../../../../../../base/widgets/base_stateless_widget.dart';

class NoTasksAvailableView extends BaseStatelessWidget {
  const NoTasksAvailableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.spacing_50, horizontal: Dimens.spacing_32),
        child: Center(
            child: Column(
          children: [
            SvgPicture.asset(
              FormsFlowAIImageAssets.imagesIconNoResults,
              width: Dimens.size_200,
              height: Dimens.size_200,
              fit: BoxFit.contain,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                Strings.generalNoData,
                style: AppTextStyles.blackTextStyle_24,
              ),
            ),
          ],
        )));
  }
}
