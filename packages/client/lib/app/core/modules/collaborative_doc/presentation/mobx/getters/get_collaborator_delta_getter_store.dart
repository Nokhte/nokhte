// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'get_collaborator_delta_getter_store.g.dart';

class GetCollaboratorDeltaGetterStore = _GetCollaboratorDeltaGetterStoreBase
    with _$GetCollaboratorDeltaGetterStore;

abstract class _GetCollaboratorDeltaGetterStoreBase extends Equatable
    with Store {
  final GetCollaboratorDelta logic;

  _GetCollaboratorDeltaGetterStoreBase({required this.logic});

  Future<Either<Failure, CollaborativeDocCollaboratorDeltaEntity>>
      call() async => await logic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
