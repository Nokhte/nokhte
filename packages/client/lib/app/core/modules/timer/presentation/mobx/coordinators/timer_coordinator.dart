// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/timer/presentation/presentation.dart';
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

  // @action
  // markdownThe

  @override
  List<Object> get props => [];
}
