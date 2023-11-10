// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'move_individual_perspectives_audio_to_collective_space_getter_store.g.dart';

class MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStore = _MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStoreBase
    with _$MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStore;

abstract class _MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStoreBase
    extends Equatable with Store {
  final MoveIndividualPerspectivesAudioToCollectiveSpace logic;

  _MoveIndividualPerspectivesAudioToCollectiveSpaceGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, IndividualAudioMovementToCollectiveSpaceStatusEntity>>
      call(params) async => await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
