import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

import 'canvas/spotlight_halo_painter.dart';

class SpotlightHalo extends HookWidget {
  final SpotlightHaloStore store;
  const SpotlightHalo({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: Padding(
          padding: const EdgeInsets.only(left: 11.5),
          child: CustomPaint(
            painter: SpotlightHaloPainter(),
          ),
        ),
      ),
    );
  }
}
