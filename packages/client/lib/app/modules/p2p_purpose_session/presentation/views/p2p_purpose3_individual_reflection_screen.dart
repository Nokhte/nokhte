import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

class P2PPurpose3IndividualRefletionScreen extends StatefulWidget
    with WidgetsBindingObserver {
  final P2PPurposePhase3Coordinator coordinator;

  P2PPurpose3IndividualRefletionScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.widgets.preventOnShoreSeizure();
  }

  @override
  State<P2PPurpose3IndividualRefletionScreen> createState() =>
      _P2PPurpose3IndividualRefletionScreenState();
}

class _P2PPurpose3IndividualRefletionScreenState
    extends State<P2PPurpose3IndividualRefletionScreen>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      widget.coordinator.setAppState(state);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return LayoutBuilder(
        builder: ((context, constraints) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Swipe(
              trackerStore: widget.coordinator.swipe,
              child: Stack(
                children: [
                  SizedBox(
                    width: constraints.widthConstraints().maxHeight,
                    height: constraints.heightConstraints().maxWidth,
                    child: NewSmartBeachWaves(
                      store: widget.coordinator.widgets.newBeachWaves,
                    ),
                    // child: SmartBeachWaves(
                    //   stateTrackerStore: widget.coordinator.beachWaves,
                    // ),
                  ),
                  Center(
                    child: SmartFadingAnimatedText(
                      stateTrackerStore: widget.coordinator.widgets.fadingText,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: SoloTextEditor(
                      maxLength: 55,
                      maxLines: 5,
                      fadeInDuration: Seconds.get(2),
                      trackerStore: widget.coordinator.widgets.textEditor,
                    ),
                  ),
                ],
              ),
            ))),
      );
    });
  }
}
