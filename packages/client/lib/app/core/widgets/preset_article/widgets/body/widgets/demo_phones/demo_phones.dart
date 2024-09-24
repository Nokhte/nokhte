// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/canvas.dart';
export 'movies/movies.dart';
export 'types/types.dart';

class DemoPhones extends HookWidget {
  // we will have different params but i don't think we will have any store
  final DemoTypes type;
  final double opacity;
  final double currentPosition;
  const DemoPhones({
    super.key,
    required this.type,
    required this.currentPosition,
    required this.opacity,
  });

  Widget multiFocalNotesDemo(double width) {
    return CustomAnimationBuilder(
        tween: DemoPhoneMovies.collaborativeNotes,
        duration: DemoPhoneMovies.collaborativeNotes.duration,
        control: Control.loop,
        builder: (context, value, child) {
          return SizedBox(
            height: width,
            width: width,
            child: Opacity(
              opacity: opacity,
              child: CustomPaint(
                painter: MultiFocalNotesDemoPainter(
                  slightlyAboveCenterTextOpacity: value.get('p1Text'),
                  slightlyBelowCenterTextOpacity: value.get('p1Text'),
                  aboveCenterTextOpacity: value.get('p2AboveTextOpacity'),
                  aboveCenterTextProgress: value.get('p2AboveTextProgress'),
                  belowCenterTextOpacity: value.get('p2BelowText'),
                  containerSize: width,
                  type: type,
                  colorsList: GetCurrentWaterAnimation.colors(value),
                  stopsList: GetCurrentWaterAnimation.stops(value),
                ),
              ),
            ),
          );
        });
  }

  Widget multiFocalSpeakingDemo(double width) {
    return CustomAnimationBuilder(
        tween: DemoPhoneMovies.collaborativeSpeaking,
        duration: DemoPhoneMovies.collaborativeSpeaking.duration,
        control: Control.loop,
        builder: (context, value, child) {
          return SizedBox(
            height: width,
            width: width,
            child: Opacity(
              opacity: opacity,
              child: CustomPaint(
                painter: MultiFocalSpeakingDemoPainter(
                  glowColor: value.get('glowColor'),
                  glowStrokeWidth: value.get('glowStroke'),
                  restingTextOpacity: value.get('p1Text'),
                  activeTextOpacity: value.get('p2Text'),
                  containerSize: width,
                  type: type,
                  leftPhoneColorsList:
                      GetCurrentWaterAnimation.colors(value, prefix: 'l'),
                  leftPhoneStopsList:
                      GetCurrentWaterAnimation.stops(value, prefix: 'l'),
                  rightPhoneColorsList:
                      GetCurrentWaterAnimation.colors(value, prefix: 'r'),
                  rightPhoneStopsList:
                      GetCurrentWaterAnimation.stops(value, prefix: 'r'),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final width = useFullScreenSize().width;

    if (type == DemoTypes.multifocal) {
      if (currentPosition < 0.5) {
        return multiFocalSpeakingDemo(width);
      } else if (currentPosition > 1.5) {
        return multiFocalNotesDemo(width);
      } else {
        return Container();
      }
    } else {
      return Container();
    }
    // return CustomAnimationBuilder(
    //     tween: DemoPhoneMovies.collaborativeNotes,
    //     duration: DemoPhoneMovies.collaborativeNotes.duration,
    //     control: Control.loop,
    //     builder: (context, value, child) {
    //       return SizedBox(
    //         height: width,
    //         width: width,
    //         child: Opacity(
    //           opacity: opacity,
    //           child: CustomPaint(
    //             painter: MulitFocalNotesDemoPainter(
    //               slightlyAboveCenterTextOpacity: value.get('p1Text'),
    //               slightlyBelowCenterTextOpacity: value.get('p1Text'),
    //               aboveCenterTextOpacity: value.get('p2AboveTextOpacity'),
    //               aboveCenterTextProgress: value.get('p2AboveTextProgress'),
    //               belowCenterTextOpacity: value.get('p2BelowText'),
    //               containerSize: width,
    //               type: type,
    //               isSpeaking: isSpeaking,
    //               colorsList: GetCurrentWaterAnimation.colors(value),
    //               stopsList: GetCurrentWaterAnimation.stops(value),
    //             ),
    //           ),
    //         ),
    //       );
    //     });
  }
}
