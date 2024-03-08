import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class MirroredText extends HookWidget {
  final MirroredTextStore store;
  const MirroredText({
    super.key,
    required this.store,
  });

  @override
  build(context) {
    final height = useFullScreenSize().height;
    return FullScreen(
      child: Stack(
        children: [
          Transform.flip(
            flipY: true,
            flipX: true,
            child: Stack(
              children: [
                Center(
                  child: SmartText(
                    store: store.primaryUpsideDownText,
                    topPadding: height * .15,
                    opacityDuration: Seconds.get(1),
                  ),
                ),
                Center(
                  child: SmartText(
                    store: store.secondaryUpsideDownText,
                    topPadding: height * .8,
                    bottomPadding: 0,
                    opacityDuration: Seconds.get(1),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SmartText(
              store: store.primaryRightSideUpText,
              topPadding: height * .12,
              opacityDuration: Seconds.get(1),
            ),
          ),
          Center(
            child: SmartText(
              store: store.secondaryRightSideUpText,
              topPadding: height * .86,
              bottomPadding: 0,
              opacityDuration: Seconds.get(1),
            ),
          ),

          // Center(
          //   child: Text("FLIPPED"),
          // ),
        ],
      ),
    );
  }
}
