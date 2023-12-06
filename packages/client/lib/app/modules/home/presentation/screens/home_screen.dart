// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator.dart';

class HomeScreen extends HookWidget {
  final HomeScreenCoordinatorStore coordinator;
  const HomeScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    useEffect(() {
      coordinator.homeScreenConstructorCallback();
      return null;
    }, []);
    return Builder(builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
              // onDoubleTap: () => coordinator.smartText
              //     .togglePause(gestureType: Gestures.doubleTap),
              // onTap: () =>
              //     coordinator.smartText.togglePause(gestureType: Gestures.tap),
              child: Hold(
                trackerStore: coordinator.hold,
                child: Swipe(
                  trackerStore: coordinator.swipe,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: BeachWaves(
                            store: coordinator.beachWaves,
                          )),
                      Center(
                        child: SmartText(
                          store: coordinator.smartText,
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
                              GesturePill(
                                size: size,
                                stateTrackerStore: coordinator.gesturePillStore,
                              ),
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
          );
        },
      );
    });
  }
}
