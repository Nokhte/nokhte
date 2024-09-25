import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ArticleCarouselSlider extends StatelessWidget with ArticleBodyUtils {
  final Function(double currentPosition) onScrolled;
  final Function(int currentIndex) onPageChanged;
  final List tags;
  final double containerSize;
  final double currentPosition;
  const ArticleCarouselSlider({
    super.key,
    required this.onScrolled,
    required this.onPageChanged,
    required this.tags,
    required this.containerSize,
    required this.currentPosition,
  });

  Widget mapTagToIcon(String tag, double targetValue, double containerSize) {
    switch (tag) {
      case "hold_to_speak":
        return buildIcon(
          targetValue: targetValue,
          containerSize: containerSize,
          shouldAnimate: true,
          iconBuilder: (context, size, opacity, animate) => TalkingIcons(
            isHoldToTalk: true,
            containerSize: size,
            opacity: opacity,
            shouldAnimate: true,
          ),
        );
      case "tap_to_speak":
        return buildIcon(
          targetValue: targetValue,
          containerSize: containerSize,
          shouldAnimate: true,
          iconBuilder: (context, size, opacity, animate) => TalkingIcons(
            isHoldToTalk: false,
            containerSize: size,
            opacity: opacity,
            shouldAnimate: true,
          ),
        );
      case "strict_seating":
        return buildIcon(
          targetValue: targetValue,
          containerSize: containerSize,
          shouldAnimate: true,
          iconBuilder: (context, size, opacity, animate) => StrictSeatingIcon(
            containerSize: size,
            opacity: opacity,
            shouldAnimate: true,
          ),
        );
      case "flexible_seating":
        return buildIcon(
          targetValue: targetValue,
          containerSize: containerSize,
          shouldAnimate: true,
          iconBuilder: (context, size, opacity, animate) => FlexibleSeatingIcon(
            containerSize: size,
            opacity: opacity,
            shouldAnimate: true,
          ),
        );
      case "notes_during":
      default:
        return buildIcon(
          targetValue: targetValue,
          containerSize: containerSize,
          shouldAnimate: true,
          iconBuilder: (context, size, opacity, animate) => NotesIcon(
            containerSize: size,
            opacity: opacity,
            shouldAnimate: true,
          ),
        );
    }
  }

  Widget buildIcon({
    required double targetValue,
    required Widget Function(BuildContext, double, double, bool) iconBuilder,
    required double containerSize,
    required bool shouldAnimate,
  }) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: interpolate(
                currentValue: currentPosition,
                targetValue: targetValue,
                minOutput: 30,
                maxOutput: 20,
              ),
            ),
            child: iconBuilder(
              context,
              interpolate(
                currentValue: currentPosition,
                targetValue: targetValue,
                maxOutput: containerSize * 1.5,
                minOutput: containerSize * 1,
              ),
              interpolate(
                currentValue: currentPosition,
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

  @override
  Widget build(BuildContext context) {
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
              onScrolled(value ?? 0);
            },
            onPageChanged: (value, reason) {
              onPageChanged(value);
            },
          ),
          items: List.generate(tags.length, (index) {
            return mapTagToIcon(
              tags[index],
              index.toDouble(),
              containerSize,
            );
          }),
        ),
        CarouselPlacementIndicator(
          length: tags.length,
          currentPosition: currentPosition,
          containerSize: containerSize,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Container(
            height: 1.5, // Thin line
            color: Colors.white.withOpacity(0.45),
          ),
        ),
      ],
    );
  }
}
