import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeInAndChangeColorText extends StatelessWidget {
  final FadeInAndChangeColorTextStore stateStore;
  const FadeInAndChangeColorText({super.key, required this.stateStore});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder(
          control: Control.playFromStart,
          tween: stateStore.movie,
          duration: stateStore.movie.duration,
          builder: (context, value, child) {
            if (stateStore.movieMode == FadeInTextMovieModes.fadeOutSetup) {
              stateStore.currentColor = value.get('text color');
            }
            return Opacity(
              opacity: value.get('text opacity'),
              child: PlatformText(
                stateStore.currentMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: value.get('text color'),
                    fontSize: stateStore.messageData.fontSize,
                    fontWeight: FontWeight.w300),
              ),
            );
          });
    });
  }
}
