export 'login_coordinator.dart';
export 'login_widgets_coordinator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/login/login.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  final LoginCoordinator coordinator;

  const LoginScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => coordinator.onResumed(),
              onInactive: () => null,
            ));
    final center = useCenterOffset();
    final height = useFullScreenSize().height;
    useEffect(() {
      coordinator.constructor(center);
      return null;
    }, []);
    final size = useSquareSize(relativeLength: .20);

    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Tap(
          store: coordinator.tap,
          child: Swipe(
            store: coordinator.swipe,
            child: Stack(
              children: [
                FullScreen(
                  child: BeachWaves(
                    store: coordinator.widgets.layer1BeachWaves,
                  ),
                ),
                FullScreen(
                  child: BeachWaves(
                    store: coordinator.widgets.layer2BeachWaves,
                  ),
                ),
                FullScreen(
                  child: TrailingText(
                    fontStyle: Fonts.kantumruy(
                      fontSize: 25.0,
                    ),
                    gradientList: List.filled(2, Colors.white),
                    store: coordinator.widgets.bottomTrailingText,
                    textRevealDirection: TextRevealDirection.fromLeft,
                    textContent: "Swipe Up",
                  ),
                ),
                FullScreen(
                  child: TrailingText(
                    fontStyle: Fonts.kantumruy(
                      fontSize: 25.0,
                    ),
                    gradientList: Gradients.skyMint,
                    store: coordinator.widgets.topTrailingText,
                    textRevealDirection: TextRevealDirection.fromRight,
                    textContent: "To Login",
                    additionalPadding: const EdgeInsets.only(bottom: 280),
                  ),
                ),
                GestureCross(
                  config: GestureCrossConfiguration(),
                  size: size,
                  store: coordinator.widgets.gestureCross,
                ),
                Center(
                  child: SmartText(
                    opacityDuration: Seconds.get(1),
                    store: coordinator.widgets.smartTextStore,
                    topPadding:
                        height * coordinator.widgets.smartTextTopPaddingScalar,
                    bottomPadding: height *
                        coordinator.widgets.smartTextBottomPaddingScalar,
                    subTextPadding:
                        coordinator.widgets.smartTextSubMessagePaddingScalar,
                  ),
                ),
                FullScreen(
                  child: Nokhte(
                    store: coordinator.widgets.nokhte,
                  ),
                ),
                FullScreen(
                  child: WifiDisconnectOverlay(
                    store: coordinator.widgets.wifiDisconnectOverlay,
                  ),
                ),
              ],
            ),
          ),
        ),
        //   ),
      );
    });
  }
}
