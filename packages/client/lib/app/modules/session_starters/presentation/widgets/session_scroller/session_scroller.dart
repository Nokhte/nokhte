// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
export 'mobx/session_scroller_store.dart';

class SessionScroller extends HookWidget {
  final SessionScrollerStore store;
  final List<List<Widget>> children;
  const SessionScroller({
    super.key,
    required this.store,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController(
      initialScrollOffset: 0,
    );
    useEffect(() {
      store.setScrollController(scrollController);
      return null;
    });
    return Observer(builder: (context) {
      return MultiHitStack(
        children: [
          ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: ListView.builder(
                controller: scrollController,
                physics: store.canScroll
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemCount: children.length,
                itemBuilder: (context, index) {
                  return FullScreen(
                    child: MultiHitStack(
                      children: children[index],
                    ),
                  );
                }),
          )
        ],
      );
    });
  }
}

class SlowScrollPhysics extends ScrollPhysics {
  final double factor;

  const SlowScrollPhysics({super.parent, this.factor = 0.5});

  @override
  SlowScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SlowScrollPhysics(parent: buildParent(ancestor), factor: factor);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset * factor;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    return 0.0;
  }
}
