// ignore_for_file: unused_import

import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

import 'canvas/rally_widget_painter.dart';
export 'constants/constants.dart';
export 'mobx/rally_store.dart';
export 'types/types.dart';

class Rally extends HookWidget with RallyConstants {
  final RallyStore store;
  Rally({
    super.key,
    required this.store,
  });

  Widget getWidgetsByPhase(
    RallyPhase phase,
    double containerSize,
  ) {
    switch (phase) {
      case RallyPhase.initial:
        return GestureDetector(
            onTap: () {
              store.setRallyPhase(RallyPhase.selection);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/rally_button_blue.png',
                  width: containerSize,
                  height: containerSize,
                ),
                Jost(
                  'Tap to rally',
                  fontColor: navyBlue,
                  fontSize: 20,
                )
              ],
            ));
      case RallyPhase.selection:
        return MultiHitStack(
          children: [
            Tint(
              store: store.tint,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BackButton(
                      store: store.backButton,
                      overridedColor: white,
                      topPaddingScalar: .1,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 70.0, left: 25),
                      child: Chivo(
                        "Rally with:",
                        fontSize: 45,
                        shouldCenter: true,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      case RallyPhase.activeInitiator:
        return Container();
      case RallyPhase.activeRecipient:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final containerSize = useFullScreenSize().height * 0.07;
    useEffect(() {
      store.constructor();
      return () => store.dispose();
    });

    return Observer(
      builder: (context) => AnimatedOpacity(
        duration: Seconds.get(0, milli: 500),
        opacity: useWidgetOpacity(store.showWidget),
        child: FullScreen(
          child: getWidgetsByPhase(store.phase, containerSize),
        ),
      ),
    );
  }
}
