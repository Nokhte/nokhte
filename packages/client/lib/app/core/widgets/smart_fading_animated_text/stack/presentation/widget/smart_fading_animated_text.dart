import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/smart_fading_animated_text/stack/presentation/mobx/smart_fading_animated_text_tracker_store.dart';

class SmartFadingAnimatedText extends StatefulWidget {
  final SmartFadingAnimatedTextTrackerStore stateTrackerStore;
  const SmartFadingAnimatedText({
    super.key,
    required this.stateTrackerStore,
  });

  @override
  State<SmartFadingAnimatedText> createState() =>
      _SmartFadingAnimatedTextState();
}

class _SmartFadingAnimatedTextState extends State<SmartFadingAnimatedText> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(widget.initialFadeInDelay, () {
  //     widget.stateTrackerStore.startRotatingText();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onDoubleTap: () => widget.stateTrackerStore
            .togglePause(gestureType: Gestures.doubleTap),
        onTap: () =>
            widget.stateTrackerStore.togglePause(gestureType: Gestures.tap),
        child: AnimatedOpacity(
          opacity: widget.stateTrackerStore.showText ? 1 : 0,
          duration: const Duration(milliseconds: 500), // Adjust fade duration
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlatformText(
                  widget.stateTrackerStore.currentMainText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kantumruyPro(
                    fontSize: widget.stateTrackerStore.currentMainMessageFont,
                    color: Colors.white,
                  ),
                ),
                PlatformText(
                  widget.stateTrackerStore.currentSubText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kantumruyPro(
                    fontSize: widget.stateTrackerStore.currentSubMessageFont,
                    color: Colors.white,
                  ),
                  // style: TextStyle(
                  //   fontSize: widget.stateTrackerStore.currentSubMessageFont,
                  //   color: Colors.white,
                  //   fontWeight: FontWeight.w300,
                  // ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
