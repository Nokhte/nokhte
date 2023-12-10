import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/constants/fonts.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/trailing_text/stack/presentation/widget/hidden_side.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class TrailingText extends HookWidget {
  final TrailingTextStore store;
  final TextRevealDirection textRevealDirection;
  final TextStyle textStyle = Fonts.kantumruy(25.0, Colors.white);
  final String textContent;

  TrailingText({
    super.key,
    required this.textContent,
    required this.store,
    required this.textRevealDirection,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useScreenSizeData();
    store.setTextSizeAndMovie(
      newTextSize: useTextSize(textContent, textStyle),
      newTextRevealDirection: textRevealDirection,
    );
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(0, milli: 500),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          builder: (context, value, child) => Row(
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
                        child: PlatformText(
                          textContent,
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      ),
                    ),
                    HiddenSide(
                      textRevealDirection: textRevealDirection,
                      // hiddenSideColor: Colors.blue.withOpacity(.9),
                      hiddenSideColor: Colors.black,
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
        ),
      ),
    );
  }
}
