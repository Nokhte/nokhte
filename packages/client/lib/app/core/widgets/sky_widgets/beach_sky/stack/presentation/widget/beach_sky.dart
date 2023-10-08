import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class BeachSky extends StatelessWidget {
  final BeachSkyStore stateTrackerStore;
  const BeachSky({
    super.key,
    required this.stateTrackerStore,
  });

  @override
  Widget build(context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder(
          tween: stateTrackerStore.movie,
          duration: stateTrackerStore.movie.duration,
          control: stateTrackerStore.control,
          builder: (context, value, child) {
            final skyValue = value.get('sky value');
            print(skyValue);
            stateTrackerStore.setSkyValue(skyValue);
            final width = MediaQuery.of(context).size.width;
            final height = MediaQuery.of(context).size.height;
            // print("$width $height SKY");
            // Path path = Path();
            final rect = Rect.fromPoints(
              const Offset(0, 0),
              Offset(
                width,
                skyValue,
              ),
            );
            // print(rect.toString());
            // stateTrackerStore.setPath(
            //   Rect.fromPoints(
            //     Offset(0, skyValue),
            //     Offset(
            //       width,
            //       stateTrackerStore.skyValue,
            //     ),
            //   ),
            // );
            return ClipRect(
              clipper: CustomRectClipper(rect),
              child: AnimatedMeshGradient(
                colors: const [
                  Colors.green,
                  Colors.greenAccent,
                  Colors.lightGreen,
                  Colors.lightGreenAccent,
                ],
                options: AnimatedMeshGradientOptions(),
              ),
            );
          });
    });
  }
}
