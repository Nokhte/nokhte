// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/logic/create_collaborative_doc.dart';
// * Mobx Codegen Inclusion
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
  List<Object> get props => [
// some items
      ];
}
