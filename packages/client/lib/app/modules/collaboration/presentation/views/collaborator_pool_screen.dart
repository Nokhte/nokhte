import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';

class CollaboratorPoolScreen extends HookWidget {
  final CollaboratorPoolScreenCoordinator coordinator;
  const CollaboratorPoolScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          FullScreen(
              child: BeachWaves(
            store: coordinator.widgets.beachWaves,
          )),
          WifiDisconnectOverlay(
            store: coordinator.widgets.wifiDisconnectOverlay,
          ),
        ],
      ),
    );
  }
}
