import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

export './session_seating_guide_store.dart';

class SessionSeatingGuide extends HookWidget {
  final SessionSeatingGuideStore store;
  const SessionSeatingGuide({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    return Observer(
      builder: (context) => AnimatedOpacity(
        opacity: useWidgetOpacity(store.showWidget),
        duration: Seconds.get(1),
        child: FullScreen(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Jost(
              '${store.values[0]}',
              fontSize: height * .05,
              fontColor: Colors.white.withOpacity(.5),
            ),
            Jost(
              '${store.values[1]}',
              fontSize: height * .1,
            ),
            Jost(
              '${store.values[2]}',
              fontSize: height * .05,
              fontColor: Colors.white.withOpacity(.5),
            ),
          ],
        )),
      ),
    );
  }
}
