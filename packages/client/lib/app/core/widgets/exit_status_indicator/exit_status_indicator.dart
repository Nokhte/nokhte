import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/exit_status_indicator_painter.dart';
export 'movies/movies.dart';
export 'types/types.dart';
export 'mobx/exit_status_indicator_store.dart';

class ExitStatusIndicator extends HookWidget {
  final ExitStatusIndicatorStore store;
  const ExitStatusIndicator({
    super.key,
    required this.store,
  });

  @override
  Widget build(context) {
    final height = useFullScreenSize().height;
    final size = useFullScreenSize();
    return Observer(
        builder: (context) => Opacity(
              opacity: useWidgetOpacity(store.showWidget),
              child: CustomAnimationBuilder(
                control: store.control,
                tween: store.movie,
                duration: store.movie.duration,
                onCompleted: () => store.onCompleted(),
                builder: ((context, value, child) => FullScreen(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: value.get('opacity'),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: height * .035),
                            child: Jost(
                              '${store.numberOfAffirmative}',
                              fontSize: height * .025,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: value.get('opacity'),
                          child: Padding(
                            padding: EdgeInsets.only(top: height * .035),
                            child: Jost(
                              '${store.total}',
                              fontSize: height * .025,
                            ),
                          ),
                        ),
                        CustomPaint(
                          painter: ExitStatusIndicatorPainter(
                            fullSize: size,
                            opacity: value.get('opacity'),
                            stroke: value.get('stroke'),
                            regularCircleRadius: value.get('radius'),
                            percentage: value.get('percentage'),
                          ),
                        ),
                      ],
                    ))),
              ),
            ));
  }
}
