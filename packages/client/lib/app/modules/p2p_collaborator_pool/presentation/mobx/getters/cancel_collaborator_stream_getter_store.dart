// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'cancel_collaborator_stream_getter_store.g.dart';

class CancelCollaboratorStreamGetterStore = _CancelCollaboratorStreamGetterStoreBase
    with _$CancelCollaboratorStreamGetterStore;

abstract class _CancelCollaboratorStreamGetterStoreBase extends Equatable
    with Store {
  final CancelCollaboratorStream cancelStreamLogic;

  _CancelCollaboratorStreamGetterStoreBase({
    required this.cancelStreamLogic,
  });

  Future<Either<Failure, CollaboratorStreamStatusEntity>> call() async =>
      await cancelStreamLogic(NoParams());
  @override
  List<Object> get props => [
// some items
      ];
}
