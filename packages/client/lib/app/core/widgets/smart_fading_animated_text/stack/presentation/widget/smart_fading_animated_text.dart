// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/presentation/mobx/smart_fading_animated_text_tracker_store.dart';

class SmartFadingAnimatedText extends StatefulWidget {
  final SmartFadingAnimatedTextTrackerStore stateTrackerStore;
  final Duration initialFadeInDelay;
  const SmartFadingAnimatedText({
    super.key,
    required this.stateTrackerStore,
    required this.initialFadeInDelay,
  });

  @override
  State<SmartFadingAnimatedText> createState() => _SmartFadingAnimatedTextState(
        stateTrackerStore: stateTrackerStore,
        initialFadeInDelay: initialFadeInDelay,
      );
}

class _SmartFadingAnimatedTextState extends State<SmartFadingAnimatedText> {
  final SmartFadingAnimatedTextTrackerStore stateTrackerStore;
  final Duration initialFadeInDelay;

  _SmartFadingAnimatedTextState({
    required this.stateTrackerStore,
    required this.initialFadeInDelay,
  });

  @override
  void initState() {
    super.initState();
    Future.delayed(initialFadeInDelay, () {
      stateTrackerStore.startRotatingText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onDoubleTap: () =>
            stateTrackerStore.togglePause(gestureType: Gestures.doubleTap),
        onTap: () => stateTrackerStore.togglePause(gestureType: Gestures.tap),
        child: AnimatedOpacity(
          opacity: stateTrackerStore.showText ? 1 : 0,
          duration: const Duration(milliseconds: 500), // Adjust fade duration
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Center(
              // child:
              Text(
                stateTrackerStore.currentMainText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: stateTrackerStore.currentMainMessageFont,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                stateTrackerStore.currentSubText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: stateTrackerStore.currentSubMessageFont,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
