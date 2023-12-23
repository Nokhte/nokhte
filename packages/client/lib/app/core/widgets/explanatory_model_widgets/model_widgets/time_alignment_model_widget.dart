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
        // GradientCircle(
        //   store: store.userCircle,
        //   gradient: ModelGradientOptions.user,
        //   bottomPadding: 500.0,
        // ),
        // GradientCircle(
        //   store: store.collaboratorCircle,
        //   gradient: ModelGradientOptions.collaborator,
        //   bottomPadding: 175.0,
        // ),
        // AvailabilitySectors(
        //   store: store.availabilitySectors,
        // ),
      ],
    ));
  }
}
