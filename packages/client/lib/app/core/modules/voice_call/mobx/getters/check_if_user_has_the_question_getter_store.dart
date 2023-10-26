// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'check_if_user_has_the_question_getter_store.g.dart';

class CheckIfUserHasTheQuestionGetterStore = _CheckIfUserHasTheQuestionGetterStoreBase
    with _$CheckIfUserHasTheQuestionGetterStore;

abstract class _CheckIfUserHasTheQuestionGetterStoreBase extends Equatable
    with Store {
  final CheckIfUserHasTheQuestion logic;

  _CheckIfUserHasTheQuestionGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, WhoGetsTheQuestionEntity>> call() async =>
      await logic(NoParams());

  @override
  List<Object> get props => [
// some items
      ];
}
