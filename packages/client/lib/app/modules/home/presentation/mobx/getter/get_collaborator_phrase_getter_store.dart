// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
part 'get_collaborator_phrase_getter_store.g.dart';

class GetCollaboratorPhraseGetterStore = _GetCollaboratorPhraseGetterStoreBase
    with _$GetCollaboratorPhraseGetterStore;

abstract class _GetCollaboratorPhraseGetterStoreBase extends Equatable
    with Store {
  final GetCollaboratorPhrase logic;

  _GetCollaboratorPhraseGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaboratorPhraseEntity>> call() async =>
      await logic(NoParams());

  @override
  List<Object> get props => [];
}
