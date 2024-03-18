import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/storage/presentation/mobx/mobx.dart';

class StorageContentScreen extends HookWidget {
  final StorageContentCoordinator coordinator;
  const StorageContentScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    final height = useFullScreenSize().height;
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Swipe(
          store: coordinator.swipe,
          child: MultiHitStack(
            children: [
              FullScreen(
                child: BeachWaves(
                  store: coordinator.widgets.beachWaves,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * .11, bottom: height * .12),
                child: ContentCard(
                  store: coordinator.widgets.contentCard,
                  content: coordinator.nokhteSessionArtifacts.content,
                ),
              ),
              GestureCross(
                showGlowAndOutline: true,
                config: GestureCrossConfiguration(
                  left: Right(
                    NokhteGradientConfig(
                      gradientType: NokhteGradientTypes.vibrantBlue,
                    ),
                  ),
                ),
                size: size,
                store: coordinator.widgets.gestureCross,
              ),
              WifiDisconnectOverlay(
                store: coordinator.widgets.wifiDisconnectOverlay,
              ),
            ],
          ),
        ),
        // ),
      );
    });
  }
}
