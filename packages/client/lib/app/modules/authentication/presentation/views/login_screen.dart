import 'package:flutter/material.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/hooks/use_center_offset.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget with WidgetsBindingObserver {
  final LoginScreenCoordinator coordinator;

  const LoginScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useOnAppLifecycleStateChange(
      (previous, current) => coordinator.setAppState(
        current,
      ),
    );
    final center = useCenterOffset();
    useEffect(() {
      coordinator.screenConstructor(center);
      WidgetsBinding.instance.addObserver(this);
      return null;
    }, []);

    return Builder(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Tap(
          trackerStore: coordinator.tap,
          child: Swipe(
            trackerStore: coordinator.swipe,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BeachWaves(
                    store: coordinator.widgets.layer1BeachWaves,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BeachWaves(
                    store: coordinator.widgets.layer2BeachWaves,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                Center(
                  child: SmartText(
                    store: coordinator.widgets.smartTextStore,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Nokhte(
                    store: coordinator.widgets.nokhte,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
