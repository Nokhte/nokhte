import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/hooks/use_square_size.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
export './mobx/article_body_store.dart';
export './types/types.dart';
export './widgets/widgets.dart';

class ArticleBody extends HookWidget {
  final ArticleBodyStore store;
  const ArticleBody({
    super.key,
    required this.store,
  });

  double interpolate({
    required double currentValue,
    required double targetValue,
    required double maxOutput,
    required double minOutput,
  }) {
    double distance = (currentValue - targetValue).abs();
    if (distance >= 1.0) {
      return minOutput;
    }
    double lerpValue = 1 - distance;
    return minOutput + (maxOutput - minOutput) * lerpValue;
  }

  double contentLerp(double input) {
    double normalizedInput = input % 1.0;

    if (normalizedInput <= 0.5) {
      return 1.0 - (normalizedInput * 2);
    } else {
      return (normalizedInput - 0.5) * 2;
    }
  }

  Widget buildIcon({
    required double targetValue,
    required Widget Function(BuildContext, double, double, bool) iconBuilder,
    required double containerSize,
    required bool shouldAnimate,
  }) {
    return Observer(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: interpolate(
                currentValue: store.currentPosition,
                targetValue: targetValue,
                minOutput: 30,
                maxOutput: 20,
              ),
            ),
            child: iconBuilder(
              context,
              interpolate(
                currentValue: store.currentPosition,
                targetValue: targetValue,
                maxOutput: containerSize * 1.5,
                minOutput: containerSize * 1,
              ),
              interpolate(
                currentValue: store.currentPosition,
                targetValue: targetValue,
                minOutput: 0.5,
                maxOutput: 1.0,
              ),
              shouldAnimate,
            ),
          ),
        ],
      );
    });
  }

  Widget buildCircle({
    required double targetValue,
    required double containerSize,
  }) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8.0),
        child: Opacity(
          opacity: interpolate(
            currentValue: store.currentPosition,
            targetValue: targetValue,
            minOutput: 0.5,
            maxOutput: 1.0,
          ),
          child: Container(
            width: containerSize * .06,
            height: containerSize * .06,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final containerSize = useSquareSize(relativeLength: .4).height;
    const shouldAnimate = true;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 23.0),
          child: Container(
            height: 1.5, // Thin line
            color: Colors.white.withOpacity(0.45),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: containerSize * .69,
            aspectRatio: 1,
            viewportFraction: .28,
            enableInfiniteScroll: false,
            onScrolled: (value) {
              store.setCurrentPosition(value ?? 0);
            },
            onPageChanged: (value, reason) {
              store.setActiveIndex(value);
            },
          ),
          items: [
            buildIcon(
              targetValue: 0,
              containerSize: containerSize,
              shouldAnimate: shouldAnimate,
              iconBuilder: (context, size, opacity, animate) => TalkingIcons(
                isHoldToTalk: true,
                containerSize: size,
                opacity: opacity,
                shouldAnimate: animate,
              ),
            ),
            buildIcon(
              targetValue: 1,
              containerSize: containerSize,
              shouldAnimate: shouldAnimate,
              iconBuilder: (context, size, opacity, animate) =>
                  FlexibleSeatingIcon(
                containerSize: size,
                opacity: opacity,
                shouldAnimate: animate,
              ),
            ),
            buildIcon(
              targetValue: 2,
              containerSize: containerSize,
              shouldAnimate: shouldAnimate,
              iconBuilder: (context, size, opacity, animate) => NotesIcon(
                containerSize: size,
                opacity: opacity,
                shouldAnimate: animate,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCircle(targetValue: 0, containerSize: containerSize),
            buildCircle(targetValue: 1, containerSize: containerSize),
            buildCircle(targetValue: 2, containerSize: containerSize),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Container(
            height: 1.5, // Thin line
            color: Colors.white.withOpacity(0.45),
          ),
        ),
        Observer(builder: (context) {
          return Opacity(
            opacity: contentLerp(store.currentPosition),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Chivo(
                    store.currentInstructionsHeader,
                    fontSize: 27,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: RichJostList(
                    contentList: store.currentInstruction,
                    isOrdered: true,
                  ),
                ),
                DemoPhones(
                  opacity: contentLerp(store.currentPosition),
                  type: DemoTypes.multifocal,
                  currentPosition: store.currentPosition,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Chivo(
                    'Reasons:',
                    fontSize: 27,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: RichJostList(
                    contentList: store.currentJustification,
                    isOrdered: false,
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
