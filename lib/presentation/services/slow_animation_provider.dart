// Theme Provider Inherited Widget
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// [SlowAnimationProvider] это провайдер для параметра медленной анимации.
class SlowAnimationProvider with ChangeNotifier {
  SlowAnimationProvider({
    required bool slow,
  }) : _slow = slow;

  bool _slow;

  bool get slow => _slow;

  set slow(bool value) {
    _slow = value;

    if (_slow) {
      timeDilation = 3;
    } else {
      timeDilation = 1;
    }

    notifyListeners();
  }
}
