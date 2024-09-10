// ignore_for_file: unused_import

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class InstructionalGradientNokhte extends HookWidget {
  final InstructionalGradientNokhteStore store;
  final bool isAnInformationalNokhte;
  const InstructionalGradientNokhte({
    super.key,
    required this.store,
    this.isAnInformationalNokhte = false,
  });
  double scaleBlur(double input) {
    const double minInput = 25;
    const double maxInput = 800;
    const double minOutput = 0;
    const double maxOutput = 100;

    if (input <= minInput) {
      return minOutput;
    } else if (input >= maxInput) {
      return maxOutput;
    } else {
      return (input - minInput) /
          (maxInput - minInput) *
          (maxOutput - minOutput);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    final screenSize = useFullScreenSize();
    useEffect(() {
      store.setScreenSize(screenSize);
      return null;
    }, []);

    return Observer(builder: (context) {
      return AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: CustomAnimationBuilder(
            tween: store.movie,
            duration: store.movie.duration,
            control: store.control,
            onCompleted: () => store.onCompleted(),
            builder: (context, value, child) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: size.width,
                          height: size.height,
                          child: SizedBox.expand(
                            child: CustomPaint(
                              painter: InstructionalGradientNokhtePainter(
                                isAnInformationNokhte: isAnInformationalNokhte,
                                text: store.text,
                                textOnTop: store.textShouldBeOnTop,
                                textOpacity: value.get('textOpacity'),
                                radius: value.get('radius'),
                                offsets: Offset(
                                  value.get('dx'),
                                  value.get('dy'),
                                ),
                                colors: [
                                  value.get('color1'),
                                  value.get('color2'),
                                  value.get('color3'),
                                  value.get('color4'),
                                ],
                                stops: [
                                  value.get('stop1'),
                                  value.get('stop2'),
                                  value.get('stop3'),
                                  value.get('stop4'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                    ],
                  ),
                  Blur(
                    colorOpacity: 0,
                    blur: scaleBlur(value.get('radius')),
                    child: FullScreen(
                      child: Container(),
                    ),
                  ),
                ],
              );
            }),
      );
    });
  }
}
