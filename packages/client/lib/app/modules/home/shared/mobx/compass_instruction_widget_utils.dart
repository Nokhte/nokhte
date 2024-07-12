import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import 'home_screen_widgets_utils.dart';

mixin CompassInstructionWidgetUtils
    on
        HomeScreenWidgetsUtils,
        BaseWidgetsCoordinator,
        SmartTextPaddingAdjuster {
  NokhteBlurStore get nokhteBlur;

  onGestureCrossTap() {
    if (!isDisconnected && !hasInitiatedBlur && !hasSwiped()) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      setHasInitiatedBlur(true);
      primarySmartText.startRotatingText(isResuming: true);
      setSmartTextPadding(subMessagePadding: 110.0, bottomPadding: 0.23);
    }
  }
}
