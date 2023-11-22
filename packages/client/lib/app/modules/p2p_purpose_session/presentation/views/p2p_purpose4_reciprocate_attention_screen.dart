import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPurpose4ReciprocateAttentionScreen extends StatelessWidget
    with WidgetsBindingObserver {
  final P2PPurposePhase4CoordinatorStore coordinator;
  P2PPurpose4ReciprocateAttentionScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      coordinator.setAppState(state);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Observer(builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SmartBeachWaves(
                      stateTrackerStore: coordinator.beachWaves,
                    ),
                  ),
                  Center(
                    child: SmartFadingAnimatedText(
                      stateTrackerStore: coordinator.fadingText,
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
