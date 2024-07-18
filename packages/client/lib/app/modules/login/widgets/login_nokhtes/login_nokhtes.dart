import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/login_nokhtes_painter.dart';
import 'login_nokhtes.dart';
export 'mobx/login_nokhtes_store.dart';
export 'movies/movies.dart';
export 'types/types.dart';

class LoginNokhtes extends HookWidget {
  final LoginNokhtesStore store;
  const LoginNokhtes({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(0, milli: 500),
        child: CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          onCompleted: () => store.onCompleted(),
          control: store.control,
          builder: (context, value, child) {
            return CustomPaint(
              painter: NokhtePainter(
                isAboutToApparate: store.isAboutToApparate,
                circleRadii: value.get('circleRadii'),
                nokhteCoordinates:
                    Offset(value.get('nokhteX'), value.get('nokhteY')),
                blueDotCoordinates:
                    Offset(value.get('blueX'), value.get('blueY')),
              ),
              size: MediaQuery.of(context).size,
            );
          },
        ),
      ),
    );
  }
}
