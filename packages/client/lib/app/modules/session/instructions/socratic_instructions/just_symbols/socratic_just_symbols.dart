import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
export 'socratic_just_symbols_coordinator.dart';
export 'socratic_just_symbols_widgets_coordinator.dart';

class SocraticJustSymbolsScreen extends HookWidget {
  final SocraticJustSymbolsCoordinator coordinator;
  const SocraticJustSymbolsScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.deconstructor();
    }, []);
    return Scaffold(
        body: Tap(
            store: coordinator.tap,
            child: MultiHitStack(
              children: [
                FullScreen(
                  child: BeachWaves(
                    store: coordinator.widgets.beachWaves,
                  ),
                ),
                BorderGlow(store: BorderGlowStore()),
                FullScreen(
                  child: TouchRipple(
                    store: coordinator.widgets.touchRipple,
                  ),
                ),
                Center(
                  child: SmartText(
                    store: coordinator.widgets.smartText,
                    topPadding: 0.45,
                    topBump: .0001,
                    subTextPadding: useScaledSize(
                      baseValue: .32,
                      bumpPerHundredth: .0001,
                      screenSize: screenSize,
                    ),
                  ),
                ),
                PresetDiagam(
                  store: coordinator.widgets.presetDiagram,
                ),
              ],
            )));
  }
}
