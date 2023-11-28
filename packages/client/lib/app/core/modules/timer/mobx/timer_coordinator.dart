// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'get_timer_information_stream_store.dart';
part 'timer_coordinator.g.dart';

class TimerCoordinator = _TimerCoordinatorBase with _$TimerCoordinator;

abstract class _TimerCoordinatorBase extends Equatable with Store {
  final GetTimerInformationStreamStore getTimeInfoStream;
  final CreateTimer createTimer;
  final DeleteTheTimer deleteTheTimer;
  final MarkdownTheTimer markdownTheTimer;
  final UpdatePresence updatePresence;
  final UpdateTimerRunningStatus updateTimerRunningStatus;

  _TimerCoordinatorBase({
    required this.createTimer,
    required this.deleteTheTimer,
    required this.getTimeInfoStream,
    required this.markdownTheTimer,
    required this.updatePresence,
    required this.updateTimerRunningStatus,
  });

  @action
  createTheTimer(CreateTimerParams params) async => await createTimer(params);

  @action
  setOnlineStatus(bool isOnline) async => await updatePresence(isOnline);

  @action
  getTimerInformationStream() async => await getTimeInfoStream(NoParams());

  @observable
  double currentTimeLeft = 0.0;

  @observable
  bool isFirstTime = true;

  @observable
  bool shouldCancelTimer = false;

  @action
  timerInfoStreamListener({
    required Function(bool) initOrPauseUITimer,
    required Function onBothCollaboratorTimersCompleted,
  }) =>
      getTimeInfoStream.timerInformationStream.listen((value) async {
        if (value.collaboratorsPresence &&
            value.usersPresence &&
            value.timerIsRunning) {
          if (isFirstTime) {
            initOrPauseUITimer(true);
            await setOnlineStatus(true);
          }
        } else if (!value.collaboratorsPresence ||
            !value.usersPresence ||
            !value.timerIsRunning) {
          initOrPauseUITimer(false);
          isFirstTime = true;
        }

        if (value.bothCollaboratorsAreReadyToMoveOn) {
          onBothCollaboratorTimersCompleted();
        }
      });

  @action
  setupAndStreamListenerActivation(
    CreateTimerParams params, {
    required Function(bool) timerUICallback,
    required Function onBothCollaboratorTimersCompleted,
  }) async {
    await createTheTimer(params);
    await getTimerInformationStream();
    timerInfoStreamListener(
      initOrPauseUITimer: timerUICallback,
      onBothCollaboratorTimersCompleted: onBothCollaboratorTimersCompleted,
    );
  }

  @override
  List<Object> get props => [];
}
