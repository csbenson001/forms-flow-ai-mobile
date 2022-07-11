import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// [ScrollControllerCallback] class based on Flutter [Hooks]
ScrollController useOnScrollCallback(
  void Function(ScrollController)? onScroll,
) {
  return use(_OnScrollCallBack(onScroll));
}

class _OnScrollCallBack extends Hook<ScrollController> {
  final void Function(ScrollController)? onScroll;

  const _OnScrollCallBack(this.onScroll);

  @override
  _OnScrollCallbackState createState() => _OnScrollCallbackState();
}

class _OnScrollCallbackState
    extends HookState<ScrollController, _OnScrollCallBack> {
  ScrollController? _controller;

  @override
  void initHook() {
    _controller = ScrollController();
    if (hook.onScroll != null) {
      _controller!.addListener(() {
        hook.onScroll!(_controller!);
      });
    }
  }

  @override
  void dispose() => _controller?.dispose();

  @override
  ScrollController build(BuildContext context) => _controller!;
}
