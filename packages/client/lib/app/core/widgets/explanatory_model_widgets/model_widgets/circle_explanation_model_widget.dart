import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class CircleExplanationModelWidget extends StatelessWidget {
  final CircleExplanationModelCoordinator store;
  const CircleExplanationModelWidget({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return FullScreen(
      child: Stack(
        children: [
          AccompanyingText(
            "You:",
            store: store.userAccompanyingText,
            gradient: ModelGradientOptions.user,
            bottomPadding: 625.0,
          ),
          GradientCircle(
            store: store.userCircle,
            gradient: ModelGradientOptions.user,
            bottomPadding: 500.0,
          ),
          AccompanyingText(
            "Collaborator:",
            store: store.collaboratorAccompanyingText,
            gradient: ModelGradientOptions.collaborator,
            bottomPadding: 300.0,
          ),
          GradientCircle(
            store: store.collaboratorCircle,
            gradient: ModelGradientOptions.collaborator,
            bottomPadding: 175.0,
          )
        ],
      ),
    );
  }
}
