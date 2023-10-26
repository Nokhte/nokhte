// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/logic/update_commit_desire_status.dart';
// * Mobx Codegen Inclusion
part 'update_commit_desire_status_getter_store.g.dart';

class UpdateCommitDesireStatusGetterStore = _UpdateCommitDesireStatusGetterStoreBase
    with _$UpdateCommitDesireStatusGetterStore;

abstract class _UpdateCommitDesireStatusGetterStoreBase extends Equatable
    with Store {
  final UpdateCommitDesireStatus logic;

  _UpdateCommitDesireStatusGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaborativeDocUpdateCommitDesireStatusEntity>> call(
          UpdateCommitDesireStatusParams params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
