// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/mobx/main/main.dart';
// * Mobx Codegen Inclusion
part 'one_talker_at_a_time_coordinator.g.dart';

class OneTalkerAtATimeCoordinator = _OneTalkerAtATimeCoordinatorBase
    with _$OneTalkerAtATimeCoordinator;

abstract class _OneTalkerAtATimeCoordinatorBase extends Equatable with Store {
  final CheckIfCollaboratorIsTalkingStore checkIfCollaboratorIsTalking;
  final UpdateWhoIsTalkingStore updateWhoIsTalking;

  _OneTalkerAtATimeCoordinatorBase({
    required this.checkIfCollaboratorIsTalking,
    required this.updateWhoIsTalking,
  });

  @override
  List<Object> get props => [];
}
