// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator.dart';

class HomeScreen extends HookWidget {
  final HomeScreenCoordinator coordinator;
  const HomeScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Builder(builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
              child: Hold(
                trackerStore: coordinator.hold,
                child: Swipe(
                  trackerStore: coordinator.swipe,
                  child: WifiDisconnectOverlay(
                    store: coordinator.widgets.wifiDisconnectOverlay,
                    child: Stack(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: BeachWaves(
                              store: coordinator.widgets.beachWaves,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: SpotlightHalo(
                            store: coordinator.widgets.spotlightHalo,
                          ),
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                GestureCross(
                                  size: size,
                                  store: coordinator.widgets.gestureCross,
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
