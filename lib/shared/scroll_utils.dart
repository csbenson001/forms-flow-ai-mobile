import 'package:flutter/material.dart';

class ScrollUtil {
  static bool isBottom({required ScrollController scrollController}) {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
