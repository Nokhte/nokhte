import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import 'canvas/spotlight_halo_painter.dart';

class SpotlightHalo extends HookWidget {
  final SpotlightHaloStore store;
  const SpotlightHalo({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
