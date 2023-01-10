import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_text_styles.dart';
import 'package:formsflowai_shared/shared/dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/networkmanager/internet_connectivity_provider.dart';

class NoInternetTopSnackBarView extends ConsumerWidget {
  const NoInternetTopSnackBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityResult = ref.watch(internetConnectivityProvider);

    return connectivityResult == ConnectivityResult.none
        ? Container(
            height: Dimens.size_40,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: Dimens.spacing_4),
                  child: Icon(
                    Icons.info,
                    color: Colors.white,
                    size: Dimens.size_20,
                  ),
                ),
                Text(
                  "No Internet!",
                  style: AppTextStyles.whiteTextStyle_14,
                ),
              ],
            ))
        : const SizedBox.shrink();
  }
}
