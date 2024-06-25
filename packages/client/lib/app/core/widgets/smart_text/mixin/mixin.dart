import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/seconds.dart';

mixin SmartTextPaddingAdjuster on Store {
  @observable
  double smartTextTopPaddingScalar = 0;

  @observable
  double smartTextBottomPaddingScalar = .2;

  @observable
  double smartTextSubMessagePaddingScalar = 110;

  @action
  setSmartTextTopPaddingScalar(double value) =>
      smartTextTopPaddingScalar = value;

  @action
  setSmartTextBottomPaddingScalar(double value) =>
      smartTextBottomPaddingScalar = value;

  @action
  setSmartTextSubMessagePaddingScalar(double value) =>
      smartTextSubMessagePaddingScalar = value;

  @action
  void setSmartTextPadding({
    double? topPadding,
    double? bottomPadding,
    double? subMessagePadding,
  }) =>
      Timer(Seconds.get(1, milli: 500), () {
        if (topPadding != null) {
          setSmartTextTopPaddingScalar(topPadding);
        }
        if (bottomPadding != null) {
          setSmartTextBottomPaddingScalar(bottomPadding);
        }
        if (subMessagePadding != null) {
          setSmartTextSubMessagePaddingScalar(subMessagePadding);
        }
      });
}
