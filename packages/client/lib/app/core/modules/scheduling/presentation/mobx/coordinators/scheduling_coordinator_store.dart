// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/scheduling/presentation/presentation.dart';
part 'scheduling_coordinator_store.g.dart';

class SchedulingCoordinatorStore = _SchedulingCoordinatorStoreBase
    with _$SchedulingCoordinatorStore;

abstract class _SchedulingCoordinatorStoreBase extends Equatable with Store {
  final CreateSchedulingSessionStore createSchedulingSessionStore;
  final GetCollaboratorsDateAndTimeStore getCollaboratorsDateAndTimeStore;
  final UpdateSchedulingTimeOrDateStore updateSchedulingTimeOrDateStore;
  _SchedulingCoordinatorStoreBase({
    required this.createSchedulingSessionStore,
    required this.getCollaboratorsDateAndTimeStore,
    required this.updateSchedulingTimeOrDateStore,
  });

  @action
  createSchedulingAndStreamSetup() async {
    await createSchedulingSessionStore(NoParams());
    await getCollaboratorsDateAndTimeStore(NoParams());
  }

  @override
  List<Object> get props => [];
}
