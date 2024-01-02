// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'home_screen_coordinator.g.dart';

class HomeScreenCoordinator = _HomeScreenCoordinatorBase
    with _$HomeScreenCoordinator;

abstract class _HomeScreenCoordinatorBase extends BaseCoordinator with Store {
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;
  final GetExistingCollaborationsInfoStore getExistingCollaborationInfo;
  final GetInvitationURLStore getInvitationURL;
  final ShareCollaborationInvitationStore shareCollaborationInvitation;
  final HomeScreenWidgetsCoordinator widgets;

  _HomeScreenCoordinatorBase({
    required this.addNameToDatabaseStore,
    required this.getCollaboratorPhraseStore,
    required this.getExistingCollaborationInfo,
    required this.getInvitationURL,
    required this.shareCollaborationInvitation,
    required this.widgets,
  });

  @action
  constructor() async {
    widgets.constructor();
    widgets.initReactors(onGradientTreeNodeTap: onGradientTreeNodeTap);
    await getExistingCollaborationInfo(NoParams());
    await addNameToDatabaseStore(NoParams());
    await getCollaboratorPhraseStore(NoParams());
  }

  @action
  onAppLifeCycleStateChange(p0) {
    switch (p0) {
      case AppLifecycleState.resumed:
        widgets.onResumed();
      case AppLifecycleState.inactive:
        widgets.onInactive();
      default:
        break;
    }
  }

  @action
  onGradientTreeNodeTap() {
    shareCollaborationInvitation(NoParams());
  }

  @override
  List<Object> get props => [];
}
