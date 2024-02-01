// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nokhte_session_logic_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NokhteSessionLogicCoordinator
    on _NokhteSessionLogicCoordinatorBase, Store {
  late final _$hasTheQuestionAtom = Atom(
      name: '_NokhteSessionLogicCoordinatorBase.hasTheQuestion',
      context: context);

  @override
  bool get hasTheQuestion {
    _$hasTheQuestionAtom.reportRead();
    return super.hasTheQuestion;
  }

  @override
  set hasTheQuestion(bool value) {
    _$hasTheQuestionAtom.reportWrite(value, super.hasTheQuestion, () {
      super.hasTheQuestion = value;
    });
  }

  late final _$checkIfUserHasTheQuestionAsyncAction = AsyncAction(
      '_NokhteSessionLogicCoordinatorBase.checkIfUserHasTheQuestion',
      context: context);

  @override
  Future checkIfUserHasTheQuestion() {
    return _$checkIfUserHasTheQuestionAsyncAction
        .run(() => super.checkIfUserHasTheQuestion());
  }

  @override
  String toString() {
    return '''
hasTheQuestion: ${hasTheQuestion}
    ''';
  }
}
