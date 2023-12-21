import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class AccompanyingText extends StatelessWidget {
  final AccompanyingTextStore store;
  const AccompanyingText({
    super.key,
    required this.store,
  });
  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => CustomAnimationBuilder(
            tween: store.movie,
            duration: store.movie.duration,
            control: store.control,
            builder: (context, value, child) => AnimatedOpacity(
                opacity: useWidgetOpacity(store.showWidget),
                duration: Seconds.get(0),
                child: const Placeholder()),
          ));
}
