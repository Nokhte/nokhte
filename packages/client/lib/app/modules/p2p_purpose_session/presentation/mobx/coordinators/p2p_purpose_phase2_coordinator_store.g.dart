// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase2_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase2CoordinatorStore
    on _P2PPurposePhase2CoordinatorStoreBase, Store {
  late final _$isFirstTimeTalkingAtom = Atom(
      name: '_P2PPurposePhase2CoordinatorStoreBase.isFirstTimeTalking',
      context: context);

  @override
  bool get isFirstTimeTalking {
    _$isFirstTimeTalkingAtom.reportRead();
    return super.isFirstTimeTalking;
  }

  @override
  set isFirstTimeTalking(bool value) {
    _$isFirstTimeTalkingAtom.reportWrite(value, super.isFirstTimeTalking, () {
      super.isFirstTimeTalking = value;
    });
  }

  late final _$isFirstTimeStartingMovieAtom = Atom(
      name: '_P2PPurposePhase2CoordinatorStoreBase.isFirstTimeStartingMovie',
      context: context);

  @override
  bool get isFirstTimeStartingMovie {
    _$isFirstTimeStartingMovieAtom.reportRead();
    return super.isFirstTimeStartingMovie;
  }

  @override
  set isFirstTimeStartingMovie(bool value) {
    _$isFirstTimeStartingMovieAtom
        .reportWrite(value, super.isFirstTimeStartingMovie, () {
      super.isFirstTimeStartingMovie = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_P2PPurposePhase2CoordinatorStoreBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$audioButtonHoldStartCallbackAsyncAction = AsyncAction(
      '_P2PPurposePhase2CoordinatorStoreBase.audioButtonHoldStartCallback',
      context: context);

  @override
  Future audioButtonHoldStartCallback() {
    return _$audioButtonHoldStartCallbackAsyncAction
        .run(() => super.audioButtonHoldStartCallback());
  }

  late final _$_P2PPurposePhase2CoordinatorStoreBaseActionController =
      ActionController(
          name: '_P2PPurposePhase2CoordinatorStoreBase', context: context);

  @override
  dynamic initOrPauseTimesUp(bool shouldRun) {
    final _$actionInfo =
        _$_P2PPurposePhase2CoordinatorStoreBaseActionController.startAction(
            name: '_P2PPurposePhase2CoordinatorStoreBase.initOrPauseTimesUp');
    try {
      return super.initOrPauseTimesUp(shouldRun);
    } finally {
      _$_P2PPurposePhase2CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic audioButtonHoldEndCallback() {
    final _$actionInfo =
        _$_P2PPurposePhase2CoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPurposePhase2CoordinatorStoreBase.audioButtonHoldEndCallback');
    try {
      return super.audioButtonHoldEndCallback();
    } finally {
      _$_P2PPurposePhase2CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstTimeTalking: ${isFirstTimeTalking},
isFirstTimeStartingMovie: ${isFirstTimeStartingMovie}
    ''';
  }
}
