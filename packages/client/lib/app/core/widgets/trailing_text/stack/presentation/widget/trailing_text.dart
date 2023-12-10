import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/trailing_text/stack/presentation/widget/hidden_side.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class TrailingText extends HookWidget {
  final TrailingTextStore store;
  final TextRevealDirection textRevealDirection;
  final TextStyle fontStyle;
  final String textContent;
  final List<Color> gradientList;
  final EdgeInsets additionalPadding;

  const TrailingText({
    super.key,
    required this.textContent,
    required this.store,
    required this.textRevealDirection,
    required this.fontStyle,
    required this.gradientList,
    this.additionalPadding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useScreenSizeData();
    store.setTextSizeAndMovie(
      newTextSize: useTextSize(textContent, fontStyle),
      newTextRevealDirection: textRevealDirection,
    );
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(0, milli: 500),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          onCompleted: () => store.onCompleted(),
          control: store.control,
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: screenSize.width,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: value.get("leftPadding"),
                              right: value.get("rightPadding"),
                            ),
                            child: GradientText(
                              colors: gradientList,
                              textContent,
                              textAlign: TextAlign.center,
                              style: fontStyle,
                            ),
                          ),
                        ),
                        HiddenSide(
                          textRevealDirection: textRevealDirection,
                          hiddenSideColor: Colors.black,
                          // hiddenSideColor: Colors.blue.withOpacity(.6),
                          size: Size(
                            (screenSize.width / 2),
                            store.textSize.height,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: additionalPadding,
              )
            ],
          ),
        ),
      ),
    );
  }
}
