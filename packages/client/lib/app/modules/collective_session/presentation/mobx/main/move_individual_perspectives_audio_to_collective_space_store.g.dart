// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_individual_perspectives_audio_to_collective_space_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoveIndividualPerspectivesAudioToCollectiveSpaceStore
    on _MoveIndividualPerspectivesAudioToCollectiveSpaceStoreBase, Store {
  late final _$isMovedAtom = Atom(
      name:
          '_MoveIndividualPerspectivesAudioToCollectiveSpaceStoreBase.isMoved',
      context: context);

  @override
  bool get isMoved {
    _$isMovedAtom.reportRead();
    return super.isMoved;
  }

  @override
  set isMoved(bool value) {
    _$isMovedAtom.reportWrite(value, super.isMoved, () {
      super.isMoved = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name:
          '_MoveIndividualPerspectivesAudioToCollectiveSpaceStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<IndividualAudioMovementToCollectiveSpaceStatusEntity>
      get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<IndividualAudioMovementToCollectiveSpaceStatusEntity>
          value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_MoveIndividualPerspectivesAudioToCollectiveSpaceStoreBase.call',
      context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isMoved: ${isMoved},
futureStore: ${futureStore}
    ''';
  }
}
