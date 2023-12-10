import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/trailing_text/stack/presentation/mobx/trailing_text_store.dart';
import 'package:simple_animations/simple_animations.dart';

class TrailingText extends StatelessWidget {
  final TrailingTextStore store;
  const TrailingText({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AnimatedOpacity(
          opacity: 1,
          duration: Seconds.get(0, milli: 500),
          child: CustomAnimationBuilder(
            tween: store.movie,
            duration: store.movie.duration,
            control: store.control,
            builder: (context, value, child) => Row(
              children: [
                PlatformText("something"),
                Container(),
              ],
            ),
          ),
        ),
      );
}
