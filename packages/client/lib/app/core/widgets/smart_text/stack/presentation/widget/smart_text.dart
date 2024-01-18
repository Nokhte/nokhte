import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:simple_animations/simple_animations.dart';

class SmartText extends StatelessWidget {
  final SmartTextStore store;
  final Duration opacityDuration;
  final double topPadding;
  final double bottomPadding; // added
  const SmartText({
    super.key,
    required this.store,
    this.opacityDuration = Duration.zero,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0, //added
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
            duration: FadeInAndOutMovie.movie.duration, // Adjust fade duration
            builder: (context, primaryValue, child) => Opacity(
              opacity: primaryValue.get('opacity'), // <== like here
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
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              store.currentMainText,
                              textAlign: TextAlign.center,
                              style: Fonts.kantumruy(
                                fontSize: store.currentMainTextFontSize,
                                color: altValue.get('color'),
                              ),
                            ),
                            Text(
                              store.currentSubText,
                              textAlign: TextAlign.center,
                              style: Fonts.kantumruy(
                                fontSize: store.currentSubTextFontSize,
                                color: altValue.get('color'),
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
