import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/fade_in_and_change_color_text/stack/mobx/fade_in_and_change_color_text_store.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:primala/app/core/widgets/fade_in_and_change_color_text/stack/constants/types/movie_modes.dart';

/// this will need some alterations
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
            if (stateStore.movieMode == MovieModes.fadeOutSetup) {
              stateStore.currentColor = value.get('text color');
            }
            return Opacity(
              opacity: value.get('text opacity'),
              child: PlatformText(
                'Waiting On Collaborator',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: value.get('text color'),
                    fontSize: 50,
                    fontWeight: FontWeight.w300),
              ),
            );
          });
    });
  }
}
