// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
import 'package:nokhte/app/core/types/types.dart';
part 'timer_coordinator.g.dart';

class TimerCoordinator = _TimerCoordinatorBase with _$TimerCoordinator;

abstract class _TimerCoordinatorBase extends Equatable with Store {
  final CreateTimerStore createTimer;
  final DeleteTheTimerStore deleteTheTimer;
  final GetTimerInformationStreamStore getTimeInfoStream;
  final MarkdownTheTimerStore markdownTheTimer;
  final UpdatePresenceStore updatePresence;
  final UpdateTimerRunningStatusStore updateTimerRunningStatus;

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
  timerInfoStreamListener(Function(bool) initOrPauseCallback) =>
      getTimeInfoStream.timerInformationStream.listen((value) {
        Timer theTimerVal = Timer.periodic(Seconds.get(0), (timer) {});
        currentTimeLeft = value.remainingTimeInMilliseconds;
        if (value.collaboratorsPresence &&
            value.usersPresence &&
            value.timerIsRunning) {
          if (currentTimeLeft != value.remainingTimeInMilliseconds ||
              isFirstTime) {
            initOrPauseCallback(true);
            theTimerVal = Timer.periodic(Seconds.get(1), (theTimer) async {
              await markdownTheTimer(NoParams());
              isFirstTime = false;
              if (shouldCancelTimer) {
                theTimer.cancel();
              }
            });
          }
        } else if (!value.collaboratorsPresence ||
            !value.usersPresence ||
            !value.timerIsRunning) {
          shouldCancelTimer = true;
          initOrPauseCallback(false);
          theTimerVal.cancel();
          isFirstTime = true;
        }
      });

  @action
  setupAndStreamListenerActivation(
      CreateTimerParams params, Function(bool) callback) async {
    await createTheTimer(params);
    await setOnlineStatus(true);
    await getTimerInformationStream();
    timerInfoStreamListener(callback);
  }

  @override
  List<Object> get props => [];
}
