// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/domain/logic/get_collaborator_individual_session_metadata.dart';
part 'get_collaborator_individual_session_metadata_getter_store.g.dart';

class GetCollaboratorIndividualSessionMetadataGetterStore = _GetCollaboratorIndividualSessionMetadataGetterStoreBase
    with _$GetCollaboratorIndividualSessionMetadataGetterStore;

abstract class _GetCollaboratorIndividualSessionMetadataGetterStoreBase
    extends Equatable with Store {
  final GetCollaboratorIndividualSessionMetadata logic;

  _GetCollaboratorIndividualSessionMetadataGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaboratorIndividualSessionMetadataEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
