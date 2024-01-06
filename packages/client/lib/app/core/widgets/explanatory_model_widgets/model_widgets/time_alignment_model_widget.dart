import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class TimeAlignmentModelWidget extends StatelessWidget {
  final TimeAlignmentModelCoordinator store;
  const TimeAlignmentModelWidget({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(0, milli: 500),
        child: FullScreen(
            child: MultiHitStack(
          children: [
            ClockFace(
              store: store.clockFace,
            ),
            AvailabilitySectors(
              store: store.availabilitySectors,
            ),
          ],
        )),
      );
    });
  }
}
