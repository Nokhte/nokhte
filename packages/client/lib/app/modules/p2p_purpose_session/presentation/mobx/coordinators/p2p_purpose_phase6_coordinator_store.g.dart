// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase6_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase6CoordinatorStore
    on _P2PPurposePhase6CoordinatorStoreBase, Store {
  Computed<bool>? _$isFirstTimeComputed;

  @override
  bool get isFirstTime =>
      (_$isFirstTimeComputed ??= Computed<bool>(() => super.isFirstTime,
              name: '_P2PPurposePhase6CoordinatorStoreBase.isFirstTime'))
          .value;
  Computed<bool>? _$isSecondTimeComputed;

  @override
  bool get isSecondTime =>
      (_$isSecondTimeComputed ??= Computed<bool>(() => super.isSecondTime,
              name: '_P2PPurposePhase6CoordinatorStoreBase.isSecondTime'))
          .value;

  late final _$firstValueAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.firstValue',
      context: context);

  @override
  int get firstValue {
    _$firstValueAtom.reportRead();
    return super.firstValue;
  }

  @override
  set firstValue(int value) {
    _$firstValueAtom.reportWrite(value, super.firstValue, () {
      super.firstValue = value;
    });
  }

  late final _$secondValueAtom = Atom(
      name: '_P2PPurposePhase6CoordinatorStoreBase.secondValue',
      context: context);

  @override
  int get secondValue {
    _$secondValueAtom.reportRead();
    return super.secondValue;
  }

  @override
  set secondValue(int value) {
    _$secondValueAtom.reportWrite(value, super.secondValue, () {
      super.secondValue = value;
    });
  }

  late final _$updateTheBackendAsyncAction = AsyncAction(
      '_P2PPurposePhase6CoordinatorStoreBase.updateTheBackend',
      context: context);

  @override
  Future updateTheBackend(bool isAForwardMovement) {
    return _$updateTheBackendAsyncAction
        .run(() => super.updateTheBackend(isAForwardMovement));
  }

  late final _$conveyerBeltControllerAsyncAction = AsyncAction(
      '_P2PPurposePhase6CoordinatorStoreBase.conveyerBeltController',
      context: context);

  @override
  Future conveyerBeltController() {
    return _$conveyerBeltControllerAsyncAction
        .run(() => super.conveyerBeltController());
  }

  late final _$_P2PPurposePhase6CoordinatorStoreBaseActionController =
      ActionController(
          name: '_P2PPurposePhase6CoordinatorStoreBase', context: context);

  @override
  dynamic valueTrackingSetup(int p0) {
    final _$actionInfo =
        _$_P2PPurposePhase6CoordinatorStoreBaseActionController.startAction(
            name: '_P2PPurposePhase6CoordinatorStoreBase.valueTrackingSetup');
    try {
      return super.valueTrackingSetup(p0);
    } finally {
      _$_P2PPurposePhase6CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstValue: ${firstValue},
secondValue: ${secondValue},
isFirstTime: ${isFirstTime},
isSecondTime: ${isSecondTime}
    ''';
  }
}
