// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:nokhte_backend/constants/types/types.dart';
part 'enter_collaborator_pool_getter_store.g.dart';

class EnterCollaboratorPoolGetterStore = _EnterCollaboratorPoolGetterStoreBase
    with _$EnterCollaboratorPoolGetterStore;

abstract class _EnterCollaboratorPoolGetterStoreBase extends Equatable
    with Store {
  final EnterCollaboratorPool enterPoolLogic;

  _EnterCollaboratorPoolGetterStoreBase({
    required this.enterPoolLogic,
  });

  Future<Either<Failure, CollaboratorPoolEntryStatusEntity>> call(
          {required CollaboratorPhraseIDs phraseIDs}) async =>
      await enterPoolLogic(phraseIDs);

  @override
  List<Object> get props => [];
}
