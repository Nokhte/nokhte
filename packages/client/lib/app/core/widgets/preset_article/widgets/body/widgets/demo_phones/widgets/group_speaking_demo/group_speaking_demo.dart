import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'speaking_demos_painter.dart';

class GroupSpeakingDemo extends HookWidget {
  final List<SessionTags> allTheTags;
  const GroupSpeakingDemo(
    this.allTheTags, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = useFullScreenSize().width;
    return CustomAnimationBuilder(
        tween: universalSpeakingDemo,
        duration: universalSpeakingDemo.duration,
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
                allTheTags: allTheTags,
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
  }
}
