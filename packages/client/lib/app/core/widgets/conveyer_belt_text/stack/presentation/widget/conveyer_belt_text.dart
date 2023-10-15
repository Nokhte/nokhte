import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/conveyer_belt_text/stack/presentation/presentation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

class ConveyerBeltText extends StatelessWidget {
  final ConveyerBeltTextStore trackerStore;
  final Size size;
  const ConveyerBeltText({
    super.key,
    required this.size,
    required this.trackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder(
          tween: MovieTween(),
          duration: Seconds.get(0),
          builder: (context, value, child) {
            return Stack(children: [
              for (int i = 0; i < trackerStore.theFocusedList.length; i++)
                PlatformText(trackerStore.theFocusedList[i].formatted),
            ]);
          });
    });
  }
}
