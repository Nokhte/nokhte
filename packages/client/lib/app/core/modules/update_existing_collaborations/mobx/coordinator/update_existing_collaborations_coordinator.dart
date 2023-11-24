// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// import 'package:dartz/dartz.dart';
// import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/mobx/main/main.dart';
// import 'package:nokhte/app/core/modules/update_existing_collaborations/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'update_existing_collaborations_coordinator.g.dart';

class UpdateExistingCollaborationsCoordinator = _UpdateExistingCollaborationsCoordinatorBase
    with _$UpdateExistingCollaborationsCoordinator;

abstract class _UpdateExistingCollaborationsCoordinatorBase extends Equatable
    with Store {
  final ConsecrateTheCollaborationStore consecrateTheCollaboration;
  final UpdateIndividualCollaboratorEntryStatusStore
      updateIndividualCollaboratorEntryStatus;
  final UpdateCollaborationActivationStatusStore
      updateCollaborationActivationStatus;

  _UpdateExistingCollaborationsCoordinatorBase({
    required this.consecrateTheCollaboration,
    required this.updateCollaborationActivationStatus,
    required this.updateIndividualCollaboratorEntryStatus,
  });
  @override
  List<Object> get props => [
// some items
      ];
}
