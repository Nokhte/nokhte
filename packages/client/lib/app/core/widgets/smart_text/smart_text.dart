import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'constants/constants.dart';
export 'mobx/smart_text_store.dart';
export 'movies/movies.dart';
export 'types/types.dart';

class SmartText extends StatelessWidget {
  final SmartTextStore store;
  final Duration opacityDuration;
  final double topPadding;
  final double bottomPadding;
  final double subTextPadding;
  const SmartText({
    super.key,
    required this.store,
    this.opacityDuration = Duration.zero,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.subTextPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AnimatedOpacity(
          opacity: useWidgetOpacity(store.showWidget),
          duration: opacityDuration,
          child: CustomAnimationBuilder(
            tween: FadeInAndOutMovie.movie,
            control: store.control,
            onCompleted: () => store.onOpacityTransitionComplete(),
            duration: FadeInAndOutMovie.movie.duration,
            builder: (context, primaryValue, child) => Opacity(
              opacity: primaryValue.get('opacity'),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                  top: topPadding,
                  bottom: bottomPadding,
                ),
                child: Observer(builder: (context) {
                  return CustomAnimationBuilder(
                      tween: store.altMovie,
                      control: store.altControl,
                      duration: store.altMovie.duration,
                      builder: (context, altValue, child) {
                        return Stack(
                          children: [
                            Center(
                              child: Text(
                                store.currentMainText,
                                textAlign: TextAlign.center,
                                style: Fonts.jost(
                                  fontSize: store.currentMainTextFontSize,
                                  color: altValue.get('color'),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: subTextPadding),
                                child: Text(
                                  store.currentSubText,
                                  textAlign: TextAlign.center,
                                  style: Fonts.jost(
                                    fontSize: store.currentSubTextFontSize,
                                    color: altValue.get('color'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                }),
              ),
            ),
          ),
        ),
      );
}
