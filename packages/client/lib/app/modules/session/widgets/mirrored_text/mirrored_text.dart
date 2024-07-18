import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
export 'mobx/mirrored_text_store.dart';
export 'types/types.dart';

class MirroredText extends HookWidget {
  final MirroredTextStore store;
  const MirroredText({
    super.key,
    required this.store,
  });

  @override
  build(context) {
    final height = useFullScreenSize().height;
    return Observer(builder: (context) {
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
                      topPadding: height * store.primaryUpsideDownTopPadding,
                      bottomPadding:
                          height * store.primaryUpsideDownBottomPadding,
                      opacityDuration: Seconds.get(1),
                    ),
                  ),
                  Center(
                    child: SmartText(
                      store: store.secondaryUpsideDownText,
                      topPadding: height * store.secondaryUpsideDownTopPadding,
                      bottomPadding:
                          height * store.secondaryUpsideDownBottomPadding,
                      opacityDuration: Seconds.get(1),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: SmartText(
                store: store.primaryRightSideUpText,
                topPadding: height * store.primaryRightSideUpTopPadding,
                bottomPadding: height * store.primaryRightSideUpBottomPadding,
                opacityDuration: Seconds.get(1),
              ),
            ),
            Center(
              child: SmartText(
                store: store.secondaryRightSideUpText,
                topPadding: height * store.secondaryRightSideUpTopPadding,
                bottomPadding: height * store.secondaryRightSideUpBottomPadding,
                opacityDuration: Seconds.get(1),
              ),
            ),

            // Center(
            //   child: Text("FLIPPED"),
            // ),
          ],
        ),
      );
    });
  }
}
