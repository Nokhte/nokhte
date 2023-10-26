// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'get_collaborator_doc_info_getter_store.g.dart';

class GetCollaboratorDocInfoGetterStore = _GetCollaboratorDocInfoGetterStoreBase
    with _$GetCollaboratorDocInfoGetterStore;

abstract class _GetCollaboratorDocInfoGetterStoreBase extends Equatable
    with Store {
  final GetCollaboratorDocInfo logic;
  _GetCollaboratorDocInfoGetterStoreBase({required this.logic});

  Future<Either<Failure, CollaborativeDocCollaboratorInfoEntity>>
      call() async => await logic(NoParams());
  @override
  List<Object> get props => [
// some items
      ];
}
