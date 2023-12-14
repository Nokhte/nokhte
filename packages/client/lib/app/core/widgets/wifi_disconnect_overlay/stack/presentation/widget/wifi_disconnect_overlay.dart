import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class WifiDisconnectOverlay extends StatelessWidget {
  final Widget child;
  final WifiDisconnectOverlayStore store;
  const WifiDisconnectOverlay({
    super.key,
    required this.child,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          builder: (context, value, __) => Stack(
            children: [
              Blur(
                colorOpacity: 0.0,
                blur: value.get('blur'),
                child: child,
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: useWidgetOpacity(store.showWidget),
                  duration: Seconds.get(0, milli: 500),
                  child: const Text(
                    "Reconnect to Wifi",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // infront of the blur
              // CustomPaint(
              //   painter: WifiDisconnectOverlayPainter(
              //     circleRadius: value.get('circleRadius'),
              //     circleOpacity: value.get('circleOpacity'),
              //     firstArcOpacity: value.get('arc1Opacity'),
              //     secondArcOpacity: value.get('arc2Opacity'),
              //     thirdArcOpacity: value.get('arc3Opacity'),
              //   ),
              //   size: MediaQuery.of(context).size,
              // )
            ],
          ),
        ),
      );
}
