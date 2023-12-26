import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class TimeAlignmentModelWidget extends StatelessWidget {
  final TimeAlignmentModelCoordinator store;
  const TimeAlignmentModelWidget({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return FullScreen(
        child: MultiHitStack(
      children: [
        ClockFace(
          store: store.clockFace,
        ),
        AvailabilitySectors(
          store: store.availabilitySectors,
        ),
      ],
    ));
  }
}
