import 'dart:io';

import 'package:flutter/material.dart';

import 'app_bar_widget.dart';

/// [ToolbarAppScaffold] base toolbar app scaffold class
/// Parameters
/// [PageTitle]
/// Widget [Body]
class ToolbarAppScaffold extends StatelessWidget {
  const ToolbarAppScaffold(
      {this.pageTitle,
      this.body,
      this.resizeToAvoidBottomInset = false,
      Key? key})
      : super(key: key);

  final Widget? body;
  final String? pageTitle;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
        appBar: AppBarWidget(
          pageTitle: pageTitle!,
          iconData:
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          context: context,
        ),
        body: body);
  }
}
