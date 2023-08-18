// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/home/domain/entities/entities.dart';
import 'package:primala/app/modules/home/domain/logic/logic.dart';
// * Mobx Codegen Inclusion
part 'get_collaborator_phrase_getter_store.g.dart';

class GetCollaboratorPhraseGetterStore = _GetCollaboratorPhraseGetterStoreBase
    with _$GetCollaboratorPhraseGetterStore;

abstract class _GetCollaboratorPhraseGetterStoreBase extends Equatable
    with Store {
  final GetCollaboratorPhrase getCollaboratorPhraseLogic;

  _GetCollaboratorPhraseGetterStoreBase({
    required this.getCollaboratorPhraseLogic,
  });

  Future<Either<Failure, CollaboratorPhraseEntity>> call() async =>
      await getCollaboratorPhraseLogic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
