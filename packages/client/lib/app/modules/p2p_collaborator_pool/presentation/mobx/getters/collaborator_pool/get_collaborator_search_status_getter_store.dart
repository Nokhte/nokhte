// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/collaborator_pool/get_collaborator_search_status.dart';
// * Mobx Codegen Inclusion
part 'get_collaborator_search_status_getter_store.g.dart';

class GetCollaboratorSearchStatusGetterStore = _GetCollaboratorSearchStatusGetterStoreBase
    with _$GetCollaboratorSearchStatusGetterStore;

abstract class _GetCollaboratorSearchStatusGetterStoreBase extends Equatable
    with Store {
  final GetCollaboratorSearchStatus collaboratorSearchStatusLogic;

  _GetCollaboratorSearchStatusGetterStoreBase({
    required this.collaboratorSearchStatusLogic,
  });

  Future<Either<Failure, CollaboratorSearchStatusEntity>> call() async =>
      await collaboratorSearchStatusLogic(NoParams());

  @override
  List<Object> get props => [];
}
