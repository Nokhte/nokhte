// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_if_user_has_the_question_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckIfUserHasTheQuestionStore
    on _CheckIfUserHasTheQuestionStoreBase, Store {
  late final _$hasTheQuestionAtom = Atom(
      name: '_CheckIfUserHasTheQuestionStoreBase.hasTheQuestion',
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

  late final _$futureStoreAtom = Atom(
      name: '_CheckIfUserHasTheQuestionStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<WhoHasTheQuestionEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<WhoHasTheQuestionEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_CheckIfUserHasTheQuestionStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
hasTheQuestion: ${hasTheQuestion},
futureStore: ${futureStore}
    ''';
  }
}
