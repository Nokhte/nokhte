import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

mixin BaseWidgetsCoordinator on Store {
  WifiDisconnectOverlayStore get wifiDisconnectOverlay;

  @observable
  bool isDisconnected = false;

  @observable
  bool touchIsDisabled = false;

  @action
  setIsDisconnected(bool newValue) => isDisconnected = newValue;

  @action
  setTouchIsDisabled(bool value) => touchIsDisabled = value;
}
