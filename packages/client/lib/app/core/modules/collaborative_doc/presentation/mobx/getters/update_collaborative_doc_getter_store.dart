// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'update_collaborative_doc_getter_store.g.dart';

class UpdateCollaborativeDocGetterStore = _UpdateCollaborativeDocGetterStoreBase
    with _$UpdateCollaborativeDocGetterStore;

abstract class _UpdateCollaborativeDocGetterStoreBase extends Equatable
    with Store {
  final UpdateCollaborativeDoc logic;

  _UpdateCollaborativeDocGetterStoreBase({required this.logic});

  Future<Either<Failure, CollaborativeDocUpdateStatusEntity>> call(
          UpdateCollaborativeDocParams params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
