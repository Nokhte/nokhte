import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'constants/constants.dart';
export 'mobx/smart_text_store.dart';
export 'movies/movies.dart';
export 'types/types.dart';
export 'mixin/mixin.dart';

class SmartText extends HookWidget {
  final SmartTextStore store;
  final Duration opacityDuration;
  final double topPadding;
  final double bottomPadding;
  final double subTextPadding;
  final double bottomBump;
  final double topBump;
  const SmartText({
    super.key,
    required this.store,
    this.opacityDuration = Duration.zero,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.subTextPadding = 10.0,
    this.topBump = 0.001,
    this.bottomBump = 0.001,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
    return Observer(
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
                top: useScaledSize(
                  baseValue: topPadding,
                  bumpPerHundredth: topBump,
                  screenSize: screenSize,
                ),
                bottom: useScaledSize(
                  baseValue: bottomPadding,
                  bumpPerHundredth: bottomBump,
                  screenSize: screenSize,
                ),
              ),
              child: Observer(builder: (context) {
                return CustomAnimationBuilder(
                    tween: store.altMovie,
                    control: store.altControl,
                    duration: store.altMovie.duration,
                    builder: (context, altValue, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            store.currentMainText,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            style: Fonts.jost(
                              fontSize: store.currentMainTextFontSize,
                              color: altValue.get('color'),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: subTextPadding,
                              ),
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
}
