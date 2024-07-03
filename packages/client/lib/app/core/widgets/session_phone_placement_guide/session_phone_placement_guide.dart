// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/session_phone_placement_guide_painter.dart';
export 'movies/phone_placement_arrows_movie.dart';
export 'mobx/session_phone_placement_guide_store.dart';

class SessionPhonePlacementGuide extends HookWidget {
  final SessionPhonePlacementGuideStore store;
  const SessionPhonePlacementGuide({
    super.key,
    required this.store,
  });

  @override
  Widget build(context) {
    final height = useFullScreenSize().height;
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
          control: store.control,
          tween: store.movie,
          duration: store.movie.duration,
          builder: (context, value, child) => SizedBox.expand(
            child: FullScreen(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: height * .68),
                  child: Jost(
                    '${store.values[2]}',
                    fontSize: height * .1,
                  ),
                ),
                CustomPaint(
                  painter: SessionPhonePlacementGuidePainter(
                    upwardOpacities: [
                      value.get('o1'),
                      value.get('o2'),
                      value.get('o3'),
                      value.get('o4'),
                    ],
                    downwardOpacities: [
                      value.get('o4'),
                      value.get('o3'),
                      value.get('o2'),
                      value.get('o1'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * .45),
                  child: Jost(
                    '${store.values[1]}',
                    fontSize: height * .1,
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
