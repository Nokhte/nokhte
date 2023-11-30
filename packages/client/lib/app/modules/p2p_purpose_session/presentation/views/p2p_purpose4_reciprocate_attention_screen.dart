import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPurpose4ReciprocateAttentionScreen extends StatefulWidget
    with WidgetsBindingObserver {
  final P2PPurposePhase4CoordinatorStore coordinator;
  P2PPurpose4ReciprocateAttentionScreen({
    super.key,
    required this.coordinator,
  }) {}

  @override
  State<P2PPurpose4ReciprocateAttentionScreen> createState() =>
      _P2PPurpose4ReciprocateAttentionScreenState();
}

class _P2PPurpose4ReciprocateAttentionScreenState
    extends State<P2PPurpose4ReciprocateAttentionScreen>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      widget.coordinator.setAppState(state);

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    widget.coordinator.screenConstructor();
    super.initState();
  }

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
                    child: NewSmartBeachWaves(
                      store: widget.coordinator.newBeachWaves,
                    ),
                    // child: SmartBeachWaves(
                    //   stateTrackerStore: widget.coordinator.beachWaves,
                    // ),
                  ),
                  Center(
                    child: SmartFadingAnimatedText(
                      stateTrackerStore: widget.coordinator.fadingText,
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
