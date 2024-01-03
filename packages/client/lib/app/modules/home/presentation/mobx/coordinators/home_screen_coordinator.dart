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
  final GetUserInfoStore getUserInfo;
  final ShareCollaborationInvitationStore shareCollaborationInvitation;
  final UpdateHasGoneThroughInvitationFlowStore
      updateHasGoneThroughInvitationFlow;
  final UpdateHasSentAnInvitationStore updateHasSentAnInvitation;
  final HomeScreenWidgetsCoordinator widgets;

  _HomeScreenCoordinatorBase({
    required this.addNameToDatabaseStore,
    required this.getCollaboratorPhraseStore,
    required this.getExistingCollaborationInfo,
    required this.getInvitationURL,
    required this.getUserInfo,
    required this.shareCollaborationInvitation,
    required this.updateHasGoneThroughInvitationFlow,
    required this.updateHasSentAnInvitation,
    required this.widgets,
  });

  @action
  constructor() async {
    widgets.constructor();
    await getUserInfo(NoParams());
    if (getUserInfo.hasGoneThroughInvitationFlow) {
      widgets.postInvitationFlowConstuctor();
    } else {
      widgets.invitationFlowConstructor();
    }
    widgets.initReactors(
      onGradientTreeNodeTap: onGradientTreeNodeTap,
      onInvitationFlowFinished: () => updateHasGoneThroughInvitationFlow(true),
    );
    shareInvitationReactor();
    await getExistingCollaborationInfo(NoParams());
    await addNameToDatabaseStore(NoParams());
    await getCollaboratorPhraseStore(NoParams());
    await getInvitationURL(NoParams());
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
    shareCollaborationInvitation(getInvitationURL.link);
  }

  shareInvitationReactor() =>
      reaction((p0) => shareCollaborationInvitation.isShared, (p0) {
        if (p0) {
          updateHasSentAnInvitation(true);
        }
      });

  @override
  List<Object> get props => [];
}
