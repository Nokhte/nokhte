// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/desired_negative_mode_behavior.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'p2p_perspective_session_coordinator_store.g.dart';

class P2PPerspectiveSessionCoordinatorStore = _P2PPerspectiveSessionCoordinatorStoreBase
    with _$P2PPerspectiveSessionCoordinatorStore;

abstract class _P2PPerspectiveSessionCoordinatorStoreBase
    extends BaseQuadrantAPIReceiver with Store {
  final PerspectivesWidgetsCoordinatorStore widgets;
  final VoiceCallActionsStore voiceCall;
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
    required this.voiceCall,
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

  // the problem is the extra layer

  @action
  screenConstructor() async {
    widgets.attuneTheWidgets(DateTime.now());
    await createSession(NoParams());
    await perspectivesStream(NoParams());
    textEditorSynchronizer();
    textEditorListener();
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: quadNum,
      quadrantSpread: quadSpread,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.resetRefAngle,
    );
    quadrantAPIListener();

    // Future.delayed(Seconds.get(11), () {
    //   widgets.transitionBackToShore();
    // });
  }

  @action
  setIsInitialDocLoad(bool newBool) => isInitalDocLoad = newBool;

  @action
  onSwipeUp() async {
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

  onSwipeDown() async {
    if (localPerspectives[2].isNotEmpty) {
      await commitThePerspectives(localPerspectives);
    }
  }

  // TODO implement this fully on later versions
  markDownValidationAndExecution() {
    // if (chosenIndex > 0) {
    //   perspectivesThatAreCommitted--;
    //   setChosenIndex(chosenIndex - 1);
    //   widgets.moveUpOrDownToNextPerspective(chosenIndex, shouldMoveUp: false);
    // }
  }

  perspectivesController() {
    if (isSecondTime && firstValue > 0) {
      /* INITIAL FORWARD MOVE */
      markUpValidationAndExecution();
    } else if (!isFirstTime &&
        !isSecondTime &&
        secondValue > firstValue &&
        canBeMarkedUp) {
      /* Non-iNiTiAL FORWARD MOVE */
      markUpValidationAndExecution();
    } else if (!isFirstTime && !isSecondTime && secondValue < firstValue) {
      /* BACKWARD MOVE */
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
