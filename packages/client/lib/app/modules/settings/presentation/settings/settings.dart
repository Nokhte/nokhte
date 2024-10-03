export './settings_coordinator.dart';
export './settings_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/settings/settings.dart';

class SettingsScreen extends HookWidget {
  final SettingsCoordinator coordinator;
  const SettingsScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.widgets.dispose();
    }, []);

    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiHitStack(
          children: [
            FullScreen(
              child: BeachWaves(
                store: coordinator.widgets.beachWaves,
              ),
            ),
            SmartText(
              store: coordinator.widgets.secondarySmartText,
              fontWeight: FontWeight.w300,
              bottomPadding: 0.1,
              opacityDuration: Seconds.get(1),
            ),
            YesNoButtons(
              showWidget: coordinator.widgets.showButtons,
              onYes: coordinator.onYes,
              onNo: coordinator.onNo,
            ),
            SmartText(
              store: coordinator.widgets.primarySmartText,
              bottomPadding: .7,
              fontWeight: FontWeight.w300,
              opacityDuration: Seconds.get(1),
            ),
            WifiDisconnectOverlay(
              store: coordinator.widgets.wifiDisconnectOverlay,
            ),
          ],
        ),
        // ),
      );
    });
  }
}
