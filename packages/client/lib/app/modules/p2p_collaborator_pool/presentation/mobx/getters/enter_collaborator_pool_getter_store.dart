// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/collaborator_pool_entry_status_entity.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
import 'package:primala_backend/constants/phrase_components/collaborator_phrase.dart';
// * Mobx Codegen Inclusion
part 'enter_collaborator_pool_getter_store.g.dart';

/// % TODO this & the exit can probably be generalized into a single pool
/// % but we can do that later

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
  List<Object> get props => [
// some items
      ];
}
