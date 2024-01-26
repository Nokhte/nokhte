import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ExplanationText extends StatelessWidget {
  final TextStyle chosenFont;
  final ExplanationTextStore trackerStore;

  const ExplanationText({
    super.key,
    required this.chosenFont,
    required this.trackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: trackerStore.showWidget ? 1 : 0,
        duration: Seconds.get(1),
        child: PlatformText(
          style: chosenFont,
          trackerStore.controller.text,
        ),
      );
    });
  }
}
