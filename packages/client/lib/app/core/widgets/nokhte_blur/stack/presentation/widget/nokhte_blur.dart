import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class NokhteBlur extends StatelessWidget {
  final NokhteBlurStore store;
  const NokhteBlur({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => CustomAnimationBuilder(
          tween: store.movie,
          duration: store.movie.duration,
          builder: (context, value, child) {
            return Blur(
              blur: value.get('blur'),
              child: Container(),
            );
          },
        ),
      );
}
