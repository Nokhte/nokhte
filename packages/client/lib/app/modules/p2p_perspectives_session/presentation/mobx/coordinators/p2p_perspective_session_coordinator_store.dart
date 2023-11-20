// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/desired_negative_mode_behavior.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
part 'p2p_perspective_session_coordinator_store.g.dart';

class P2PPerspectiveSessionCoordinatorStore = _P2PPerspectiveSessionCoordinatorStoreBase
    with _$P2PPerspectiveSessionCoordinatorStore;

abstract class _P2PPerspectiveSessionCoordinatorStoreBase
    extends BaseQuadrantAPIReceiver with Store {
  final VoiceCallActionsStore voiceCallActions;
  final InstantiateAgoraSdkStore instantiateAgoraSdk;
  final FetchAgoraTokenStore fetchAgoraToken;
  final FetchChannelIdStore fetchChannelId;
  final PerspectivesWidgetsCoordinatorStore widgets;
  final VoiceCallActionsStore voiceCall;
  final SwipeDetector swipe;
  final CommitThePerspectivesStore commitThePerspectives;
  final CreateAPerspectivesSessionStore createSession;
  final FetchPerspectivesStreamStore perspectivesStream;
  final UpdateCurrentQuadrantStore updateQuadStore;
  final UpdateTheStagingAreaStore updateStaging;
  final TextEditingController userController;

  final quadNum = 5;
  final quadSpread = 90;

  _P2PPerspectiveSessionCoordinatorStoreBase({
    required super.quadrantAPI,
    required this.fetchChannelId,
    required this.voiceCallActions,
    required this.instantiateAgoraSdk,
    required this.fetchAgoraToken,
    required this.voiceCall,
    required this.swipe,
    required this.widgets,
    required this.commitThePerspectives,
    required this.createSession,
    required this.perspectivesStream,
    required this.updateQuadStore,
    required this.updateStaging,
  }) : userController = widgets.collaborativeTextEditor.controller;

  @observable
  bool isInitalDocLoad = true;

  bool inProgressCommit = false;

  @observable
  String previousWord = "";

  bool canBeMarkedUp = false;

  int perspectivesThatAreCommitted = 0;

  List<String> localPerspectives = List.filled(5, "");

  @action
  screenConstructor() async {
    widgets.attuneTheWidgets(DateTime.now());
    await createSession(NoParams());
    await perspectivesStream(NoParams());
    if (!kDebugMode) {
      await instantiateAgoraSdk(NoParams());
      await fetchChannelId(NoParams());
      await fetchAgoraToken(
        FetchAgoraTokenParams(
          channelName: fetchChannelId.channelId,
        ),
      );
      await voiceCallActions.enterOrLeaveCall(
        Right(
          JoinCallParams(
            token: fetchAgoraToken.token,
            channelId: fetchChannelId.channelId,
          ),
        ),
      );
      await voiceCallActions.muteOrUnmuteAudio(wantToMute: false);
    }

    textEditorSynchronizer();
    textEditorListener();
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: quadNum,
      quadrantSpread: quadSpread,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.resetRefAngle,
    );
    quadrantAPIListener();
  }

  @action
  setIsInitialDocLoad(bool newBool) => isInitalDocLoad = newBool;

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            updateCommitStatusToYes();
          case GestureDirections.down:
            wantToFinishTheSession();
          default:
            break;
        }
      });

  @action
  updateCommitStatusToYes() async {
    inProgressCommit = true;
    await updateQuadStore(chosenIndex + 1);
    widgets.changeToInProgressColor(chosenIndex);
  }

  markUpValidationAndExecution() {
    if (canBeMarkedUp) {
      canBeMarkedUp = false;
      inProgressCommit = false;
      perspectivesThatAreCommitted++;
      setChosenIndex(chosenIndex + 1);
      updateStaging(localPerspectives);
      setIsInitialDocLoad(true);

      widgets.moveUpOrDownToNextPerspective(chosenIndex, shouldMoveUp: true);
      return;
    } else {
      quadrantAPI.resetTheQuadrantLayout(
        startingQuadrant: chosenIndex,
        numberOfQuadrants: quadNum,
        quadrantSpread: quadSpread,
      );
    }
  }

  wantToFinishTheSession() async {
    if (localPerspectives[2].isNotEmpty) {
      await commitThePerspectives(localPerspectives);
    }
  }

  markDownValidationAndExecution() {}

  perspectivesController() {
    if (isSecondTime && firstValue > 0) {
      markUpValidationAndExecution();
    } else if (!isFirstTime &&
        !isSecondTime &&
        secondValue > firstValue &&
        canBeMarkedUp) {
      markUpValidationAndExecution();
    } else if (!isFirstTime && !isSecondTime && secondValue < firstValue) {
      markDownValidationAndExecution();
    }
  }

  quadrantAPIListener() => reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
        if (p0 >= 0) {
          valueTrackingSetup(p0);
          perspectivesController();
        }
      });

  textEditorSynchronizer() => perspectivesStream.stream.listen((value) async {
        if (isInitalDocLoad) {
          widgets.setText(value.stagingAreaInfo[chosenIndex]);
          isInitalDocLoad = false;
        }
        if (value.lastEditedBy != value.currentUserUID) {
          widgets.setText(value.stagingAreaInfo[chosenIndex]);
          if (inProgressCommit) {
            inProgressCommit = false;
            await updateQuadStore(chosenIndex);
            widgets.inProgressColorReversion(chosenIndex);
          }
        }
        if (value.usersQuadrant > chosenIndex &&
            value.collaboratorsQuadrant > chosenIndex &&
            value.collaboratorsQuadrant == value.usersQuadrant) {
          canBeMarkedUp = true;
          widgets.inProgressToDoneTransition(chosenIndex);
          widgets.collaborativeTextEditor.toggleWidgetVisibility();
        }
      });

  textEditorListener() => userController.addListener(() async {
        if (previousWord != userController.text && !isInitalDocLoad) {
          previousWord = userController.text;
          localPerspectives[chosenIndex] = userController.text;
          await updateStaging(localPerspectives);
          if (inProgressCommit) {
            inProgressCommit = false;
            await updateQuadStore(chosenIndex);
            widgets.inProgressColorReversion(chosenIndex);
          }
        }
      });

  @override
  List<Object> get props => [];
}
