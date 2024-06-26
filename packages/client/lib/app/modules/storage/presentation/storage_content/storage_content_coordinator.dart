// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
part 'storage_content_coordinator.g.dart';

class StorageContentCoordinator = _StorageContentCoordinatorBase
    with _$StorageContentCoordinator;

abstract class _StorageContentCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final StorageContentWidgetsCoordinator widgets;
  final TapDetector tap;

  final SwipeDetector swipe;
  _StorageContentCoordinatorBase({
    required super.getUserInfo,
    required super.captureScreen,
    required this.tap,
    required this.widgets,
    required this.swipe,
  });

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
    await getUserInfo(NoParams());
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
          case GestureDirections.left:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeLeft();
            });
          default:
            break;
        }
      });

  @override
  deconstructor() {
    widgets.deconstructor();
    super.deconstructor();
  }
}
