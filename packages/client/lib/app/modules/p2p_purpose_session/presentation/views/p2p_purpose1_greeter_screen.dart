import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/coordinators/coordinators.dart';

class P2PPurpose1GreeterScreen extends StatefulWidget {
  final P2PPurposePhase1CoordinatorStore coordinator;
  const P2PPurpose1GreeterScreen({
    super.key,
    required this.coordinator,
  });

  @override
  State<P2PPurpose1GreeterScreen> createState() =>
      _P2PPurpose1GreeterScreenState();
}

class _P2PPurpose1GreeterScreenState extends State<P2PPurpose1GreeterScreen>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      widget.coordinator.setAppState(state);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.coordinator.screenConstructorCallback();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return LayoutBuilder(
      builder: ((context, constraints) => Observer(builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Swipe(
                trackerStore: widget.coordinator.swipe,
                child: Stack(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: NewSmartBeachWaves(
                          store: widget.coordinator.newBeachWaves,
                        )),
                    Center(
                      child: SmartFadingAnimatedText(
                        stateTrackerStore: widget.coordinator.fadingText,
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
                              stateTrackerStore:
                                  widget.coordinator.gesturePillStore,
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
            );
          })),
    );
  }
}
