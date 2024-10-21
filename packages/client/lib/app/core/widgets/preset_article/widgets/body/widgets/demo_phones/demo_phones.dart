// ignore_for_file: r[used_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'canvas/canvas.dart';
export 'movies/movies.dart';
export 'types/types.dart';
export 'widgets/widgets.dart';

class DemoPhones extends HookWidget with RallyConstants {
  final PresetTypes type;
  final bool showPowerUp;
  final double currentPosition;

  DemoPhones({
    super.key,
    required this.type,
    required this.currentPosition,
    this.showPowerUp = false,
  });

  Widget collaborativeNotesDemo(double width) => CustomAnimationBuilder(
      tween: DemoPhoneMovies.collaborativeNotes,
      duration: DemoPhoneMovies.collaborativeNotes.duration,
      control: Control.loop,
      builder: (context, value, child) {
        return SizedBox(
          height: width,
          width: width,
          child: CustomPaint(
            painter: CollaborativeNotesDemoPainter(
              slightlyAboveCenterTextOpacity: value.get('p1Text'),
              slightlyBelowCenterTextOpacity: value.get('p1Text'),
              aboveCenterTextOpacity: value.get('p2AboveTextOpacity'),
              aboveCenterTextProgress: value.get('p2AboveTextProgress'),
              belowCenterTextOpacity: value.get('p2BelowText'),
              containerSize: width,
              type: type,
              colorsList: GetCurrentWaterAnimation.colors(value, prefix: 'l'),
              stopsList: GetCurrentWaterAnimation.stops(value, prefix: 'l'),
            ),
          ),
        );
      });

  Widget consultativeNotesDemo(double width) => CustomAnimationBuilder(
      tween: DemoPhoneMovies.consultativeNotes,
      duration: DemoPhoneMovies.consultativeNotes.duration,
      control: Control.loop,
      builder: (context, value, child) {
        return SizedBox(
          height: width,
          width: width,
          child: CustomPaint(
            painter: ConsultativeNotesDemoPainter(
              slightlyAboveCenterTextOpacity: value.get('p1Text'),
              slightlyBelowCenterTextOpacity: value.get('p1Text'),
              aboveCenterTextOpacity: value.get('p2AboveTextOpacity'),
              aboveCenterTextProgress: value.get('p2AboveTextProgress'),
              belowCenterTextOpacity: value.get('p2BelowText'),
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
        );
      });

  Widget speakingDemos(double width) => CustomAnimationBuilder(
      tween: DemoPhoneMovies.collaborativeSpeaking,
      duration: DemoPhoneMovies.collaborativeSpeaking.duration,
      control: Control.loop,
      builder: (context, value, child) {
        return SizedBox(
          height: width,
          width: width,
          child: CustomPaint(
            painter: SpeakingDemosPainter(
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
        );
      });

  Widget seatingDemo(String imagePath, double width) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Chivo(
            'Example',
            fontSize: 27,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Image.asset(
            imagePath,
            width: width * 0.8,
            height: width * 0.8,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = useFullScreenSize().width;
    if (!showPowerUp) {
      if (type == PresetTypes.collaborative) {
        if (currentPosition < 0.5) {
          return speakingDemos(width);
        } else if (currentPosition > 1.5) {
          return collaborativeNotesDemo(width);
        } else {
          return seatingDemo(
            'assets/collaborative_seating.png',
            width,
          );
        }
      } else if (type == PresetTypes.consultative) {
        if (currentPosition < 0.5) {
          return speakingDemos(width);
        } else if (currentPosition > 1.5) {
          return consultativeNotesDemo(width);
        } else {
          return seatingDemo(
            'assets/consultative_seating.png',
            width,
          );
        }
      } else {
        return Container();
      }
    } else {
      if (currentPosition < 0.5) {
        if (type == PresetTypes.collaborative) {
          return RallyDemo();
        } else if (type == PresetTypes.consultative) {
          return LetEmCookDemo();
        } else {
          return Container();
        }
      } else {
        return Container();
      }
    }
  }
}
