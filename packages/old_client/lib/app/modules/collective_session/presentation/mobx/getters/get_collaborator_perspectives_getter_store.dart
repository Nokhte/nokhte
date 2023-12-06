// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
part 'get_collaborator_perspectives_getter_store.g.dart';

class GetCollaboratorPerspectivesGetterStore = _GetCollaboratorPerspectivesGetterStoreBase
    with _$GetCollaboratorPerspectivesGetterStore;

abstract class _GetCollaboratorPerspectivesGetterStoreBase extends Equatable
    with Store {
  final GetCollaboratorPerspectives logic;

  _GetCollaboratorPerspectivesGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaboratorPerspectivesEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
