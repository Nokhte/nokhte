import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/shared/builders/opacity_type.dart';
import 'package:simple_animations/simple_animations.dart';

class CustomAnimatedObserver extends StatelessWidget {
  final BaseCustomAnimatedWidgetStore store;
  final OpacityType opacityType;
  final Widget child;
  final Function(dynamic value) builderBodyCallback;

  const CustomAnimatedObserver({
    super.key,
    required this.store,
    required this.opacityType,
    required this.child,
    required this.builderBodyCallback,
  });
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: store.showWidget ? 1 : 0,
        duration: Seconds.get(opacityType == OpacityType.regular ? 0 : 1),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          // onStarted: () => store.startAndResetStopWatch(),
          builder: (context, value, child_) {
            builderBodyCallback(value);
            return child;
          },
        ),
      );
    });
  }
}
