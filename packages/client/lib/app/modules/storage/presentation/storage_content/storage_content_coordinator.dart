// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
part 'storage_content_coordinator.g.dart';

class StorageContentCoordinator = _StorageContentCoordinatorBase
    with _$StorageContentCoordinator;

abstract class _StorageContentCoordinatorBase with Store {
  final StorageContentWidgetsCoordinator widgets;
  final TapDetector tap;
  final SwipeDetector swipe;
  final BaseCoordinator base;
  _StorageContentCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.tap,
    required this.widgets,
    required this.swipe,
  }) : base = BaseCoordinator(captureScreen: captureScreen);

  @observable
  NokhteSessionArtifactEntity nokhteSessionArtifacts =
      NokhteSessionArtifactEntity.initial();

  @observable
  bool aliasIsUpdated = false;

  @action
  constructor(Offset center) async {
    if (Modular.args.data["content"] != null) {
      nokhteSessionArtifacts = Modular.args.data["content"];
    }
    widgets.constructor(center);
    await base.captureScreen(StorageConstants.content);
    initReactors();
  }

  initReactors() {
    base.disposers.add(tapReactor());
    base.disposers.add(swipeReactor());
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        base.ifTouchIsNotDisabled(() {
          widgets.onTap();
        });
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.left:
            base.ifTouchIsNotDisabled(() {
              widgets.onSwipeLeft();
            });
          default:
            break;
        }
      });

  deconstructor() {
    widgets.base.deconstructor();
    base.deconstructor();
  }
}
