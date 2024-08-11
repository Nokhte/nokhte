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

abstract class _StorageContentCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final StorageContentWidgetsCoordinator widgets;
  final TapDetector tap;
  final SwipeDetector swipe;
  @override
  final CaptureScreen captureScreen;
  _StorageContentCoordinatorBase({
    required this.captureScreen,
    required this.tap,
    required this.widgets,
    required this.swipe,
  }) {
    initBaseCoordinatorActions();
  }

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
    await captureScreen(StorageConstants.content);
    initReactors();
  }

  initReactors() {
    disposers.add(tapReactor());
    disposers.add(swipeReactor());
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap();
        });
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.right:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeRight();
            });
          default:
            break;
        }
      });

  deconstructor() {
    dispose();
    widgets.dispose();
  }
}
