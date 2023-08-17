// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/presentation/mobx/smart_fading_animated_text_tracker_store.dart';

class SmartFadingAnimatedText extends StatefulWidget {
  final SmartFadingAnimatedTextTrackerStore stateTrackerStore;
  const SmartFadingAnimatedText({
    super.key,
    required this.stateTrackerStore,
  });

  @override
  State<SmartFadingAnimatedText> createState() => _SmartFadingAnimatedTextState(
        stateTrackerStore: stateTrackerStore,
      );
}

class _SmartFadingAnimatedTextState extends State<SmartFadingAnimatedText> {
  final SmartFadingAnimatedTextTrackerStore stateTrackerStore;

  _SmartFadingAnimatedTextState({required this.stateTrackerStore});

  @override
  void initState() {
    super.initState();
    stateTrackerStore.startRotatingText(mounted);
  }

  // void _startRotatingText() async {
  //   while (true) {
  //     if (mounted) {
  //       stateTrackerStore.moveToNextMessage();
  //       await Future.delayed(const Duration(seconds: 1), () {
  //         setState(() {
  //           showText = true;
  //         });
  //       });
  //       await Future.delayed(const Duration(seconds: 1), () {
  //         setState(() {
  //           showText = false;
  //         });
  //       });
  //     }
  //   }
  // }
  // void _startRotatingText() async {
  //   while (!isPaused) {
  //     if (!isPaused && mounted) {
  //       print("IT IS NOT PAUSED");
  //       stateTrackerStore.moveToNextMessage();
  //       await Future.delayed(const Duration(seconds: 1), () {
  //         setState(() {
  //           showText = true;
  //         });
  //       });
  //       await Future.delayed(const Duration(seconds: 1), () {
  //         setState(() {
  //           showText = false;
  //         });
  //       });
  //     } else {
  //       // If paused, delay without updating the text
  //       await Future.delayed(const Duration(seconds: 2));
  //     }
  //   }
  //   while (isPaused) {
  //     print("IT IS PAUSED");
  //   }
  // }

  // void togglePause() {
  //   setState(() {
  //     isPaused = !isPaused;
  //   });
  //   print("PAUSED? ====> $isPaused");
  // }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () => stateTrackerStore.togglePause(mounted),
        child: AnimatedOpacity(
          opacity: stateTrackerStore.showText ? 1 : 0,
          duration: const Duration(milliseconds: 500), // Adjust fade duration
          child: Text(
            stateTrackerStore.currentText,
            style: const TextStyle(fontSize: 160.0),
          ),
        ),
      );
    });
  }
}
