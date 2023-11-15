// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
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
  List<Object> get props => [];
}
