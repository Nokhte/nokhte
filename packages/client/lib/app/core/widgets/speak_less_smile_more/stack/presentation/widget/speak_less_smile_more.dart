import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class SpeakLessSmileMore extends StatelessWidget {
  final SpeakLessSmileMoreStore store;
  const SpeakLessSmileMore({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: useWidgetOpacity(store.showSpeakLess),
            duration: Seconds.get(1),
            child: const Center(
              child: Jost("Speak less,"),
            ),
          ),
          AnimatedOpacity(
            opacity: useWidgetOpacity(store.showSmileMore),
            duration: Seconds.get(1),
            child: const Center(
              child: Jost(" smile more"),
            ),
          )
        ],
      );
    });
  }
}
