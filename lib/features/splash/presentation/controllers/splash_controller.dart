import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = Provider<SplashController>((ref) {
  final SplashController controller = SplashController();
  ref.onDispose(controller.dispose);
  return controller;
});

class SplashController {
  SplashController();

  Timer? _timer;
  bool _started = false;
  VoidCallback? _onComplete;

  void start(VoidCallback onComplete) {
    if (_started) {
      return;
    }

    _started = true;
    _onComplete = onComplete;
    _timer = Timer(const Duration(milliseconds: 2500), _handleComplete);
  }

  void _handleComplete() {
    _onComplete?.call();
  }

  void dispose() {
    _timer?.cancel();
  }
}
