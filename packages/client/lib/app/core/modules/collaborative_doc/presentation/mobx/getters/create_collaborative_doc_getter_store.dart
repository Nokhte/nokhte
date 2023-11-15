// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
part 'create_collaborative_doc_getter_store.g.dart';

class CreateCollaborativeDocGetterStore = _CreateCollaborativeDocGetterStoreBase
    with _$CreateCollaborativeDocGetterStore;

abstract class _CreateCollaborativeDocGetterStoreBase extends Equatable
    with Store {
  final CreateCollaborativeDoc logic;

  _CreateCollaborativeDocGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaborativeDocCreationStatusEntity>> call(
          CreateCollaborativeDocParams params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
