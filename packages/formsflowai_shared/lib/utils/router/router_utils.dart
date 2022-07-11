import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterUtils {
  static void popRoute({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static void logoutUser(
      {required BuildContext context, required String routeName}) {
    GoRouter.of(context).goNamed(routeName);
  }

  static void goToRoute({
    required BuildContext context,
    required String routeName,
  }) {
    GoRouter.of(context).goNamed(
      routeName,
    );
  }

  static void goToRouteWithExtra(
      {required BuildContext context,
      required String routeName,
      required Map<String, String> params,
      Object? extra}) {
    GoRouter.of(context).goNamed(
      routeName,
      params: params,
      extra: extra,
    );
  }

  static void pushToRoute({
    required BuildContext context,
    required String routeName,
  }) {
    GoRouter.of(context).push(
      routeName,
    );
  }

  static void pushToRouteWithExtra(
      {required BuildContext context,
      required String routeName,
      required Map<String, String> params,
      Object? extra}) {
    GoRouter.of(context).pushNamed(
      routeName,
      params: params,
      extra: extra,
    );
  }
}
