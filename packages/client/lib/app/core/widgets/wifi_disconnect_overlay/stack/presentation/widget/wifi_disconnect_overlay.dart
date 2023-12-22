import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/wifi_disconnect_overlay_painter.dart';

class WifiDisconnectOverlay extends StatelessWidget {
  final WifiDisconnectOverlayStore store;
  const WifiDisconnectOverlay({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          control: store.control,
          onCompleted: () => store.onCompleted(),
          builder: (context, value, __) => Stack(
            children: [
              FullScreen(
                child: Blur(
                  colorOpacity: 0.0,
                  blur: value.get('blur'),
                  child: Container(),
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: useWidgetOpacity(store.showWidget),
                  duration: Seconds.get(0, milli: 500),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 130),
                    child: Text(
                      "Reconnect to Wifi",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              CustomPaint(
                painter: WifiDisconnectOverlayPainter(
                  circle: OpacityAndRadius(
                    radius: value.get(CircleMovieProps.circleRadius),
                    opacity: value.get(CircleMovieProps.circleOpacity),
                  ),
                  firstArc: OpacityAndRadius(
                    radius: value.get(CircleMovieProps.arc1Radius),
                    opacity: value.get(CircleMovieProps.arc1Opacity),
                  ),
                  secondArc: OpacityAndRadius(
                    radius: value.get(CircleMovieProps.arc2Radius),
                    opacity: value.get(CircleMovieProps.arc2Opacity),
                  ),
                  thirdArc: OpacityAndRadius(
                    radius: value.get(CircleMovieProps.arc3Radius),
                    opacity: value.get(CircleMovieProps.arc3Opacity),
                  ),
                  firstCircleOutline: OpacityAndRadius(
                    radius: value.get(CircleMovieProps.circle1Radius),
                    opacity: value.get(CircleMovieProps.circle1Opacity),
                  ),
                  secondCircleOutline: OpacityAndRadius(
                    radius: value.get(CircleMovieProps.circle2Radius),
                    opacity: value.get(CircleMovieProps.circle2Opacity),
                  ),
                  thirdCircleOutline: OpacityAndRadius(
                    radius: value.get(CircleMovieProps.circle3Radius),
                    opacity: value.get(CircleMovieProps.circle3Opacity),
                  ),
                ),
                size: MediaQuery.of(context).size,
              )
            ],
          ),
        ),
      );
}
