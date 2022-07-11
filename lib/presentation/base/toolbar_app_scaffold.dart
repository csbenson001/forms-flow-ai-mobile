import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_bar_widget.dart';

/// [ToolbarAppScaffold] base toolbar app scaffold class
/// Parameters
/// [PageTitle]
/// Widget [Body]
class ToolbarAppScaffold extends StatelessWidget {
  const ToolbarAppScaffold({this.pageTitle, this.body, Key? key})
      : super(key: key);

  final Widget? body;
  final String? pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(
          pageTitle: pageTitle!,
          iconData: Icons.arrow_back,
          context: context,
        ),
        body: body);
  }
}
