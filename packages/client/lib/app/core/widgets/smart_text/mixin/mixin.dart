import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';

mixin SmartTextPaddingAdjuster {
  final _smartTextTopPaddingScalar = Observable(0.0);

  double get smartTextTopPaddingScalar => _smartTextTopPaddingScalar.value;

  final _smartTextBottomPaddingScalar = Observable(.2);

  double get smartTextBottomPaddingScalar =>
      _smartTextBottomPaddingScalar.value;

  final _smartTextSubMessagePaddingScalar = Observable(110.0);

  double get smartTextSubMessagePaddingScalar =>
      _smartTextSubMessagePaddingScalar.value;

  _setSmartTextTopPaddingScalar(double value) =>
      _smartTextTopPaddingScalar.value = value;

  _setSmartTextBottomPaddingScalar(double value) =>
      _smartTextBottomPaddingScalar.value = value;

  _setSmartTextSubMessagePaddingScalar(double value) =>
      _smartTextSubMessagePaddingScalar.value = value;

  Action actionSetSmartTextPadding = Action(() {});
  Action actionSetSmartTextTopPaddingScalar = Action(() {});
  Action actionSetSmartTextBottomPaddingScalar = Action(() {});
  Action actionSetSmartTextSubMessagePaddingScalar = Action(() {});

  initSmartTextActions() {
    actionSetSmartTextPadding = Action(_setSmartTextPadding);
    actionSetSmartTextTopPaddingScalar = Action(_setSmartTextTopPaddingScalar);
    actionSetSmartTextBottomPaddingScalar =
        Action(_setSmartTextBottomPaddingScalar);
    actionSetSmartTextSubMessagePaddingScalar =
        Action(_setSmartTextSubMessagePaddingScalar);
  }

  setSmartTextTopPaddingScalar(double value) {
    actionSetSmartTextTopPaddingScalar([value]);
  }

  setSmartTextBottomPaddingScalar(double value) {
    actionSetSmartTextBottomPaddingScalar([value]);
  }

  setSmartTextSubMessagePaddingScalar(double value) {
    actionSetSmartTextSubMessagePaddingScalar([value]);
  }

  setSmartTextPadding({
    double? topPadding,
    double? bottomPadding,
    double? subMessagePadding,
    bool excludeTimer = false,
  }) {
    actionSetSmartTextPadding.call([], {
      "subMessagePadding": subMessagePadding,
      "bottomPadding": bottomPadding,
      "topPadding": topPadding,
      "excludeTimer": excludeTimer,
    });
  }

  void _setSmartTextPadding({
    double? topPadding,
    double? bottomPadding,
    double? subMessagePadding,
    bool excludeTimer = false,
  }) =>
      Timer(excludeTimer ? Duration.zero : Seconds.get(1, milli: 500), () {
        if (topPadding != null) {
          actionSetSmartTextTopPaddingScalar([topPadding]);
        }
        if (bottomPadding != null) {
          actionSetSmartTextBottomPaddingScalar([bottomPadding]);
        }
        if (subMessagePadding != null) {
          actionSetSmartTextSubMessagePaddingScalar([subMessagePadding]);
        }
      });
}
