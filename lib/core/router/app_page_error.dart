import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../presentation/base/widgets/base_stateless_widget.dart';
import '../../shared/app_strings.dart';

/// Flutter Widget to load invalid routing screen.
class ErrorRouterPage extends BaseStatelessWidget {
  const ErrorRouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Strings.generalErrorNoRoutesAvailable),
      ),
    );
  }
}
