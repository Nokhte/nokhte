// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gesture_cross_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GestureCrossStore on _GestureCrossStoreBase, Store {
  late final _$tapCountAtom =
      Atom(name: '_GestureCrossStoreBase.tapCount', context: context);

  @override
  int get tapCount {
    _$tapCountAtom.reportRead();
    return super.tapCount;
  }

  @override
  set tapCount(int value) {
    _$tapCountAtom.reportWrite(value, super.tapCount, () {
      super.tapCount = value;
    });
  }

  late final _$_GestureCrossStoreBaseActionController =
      ActionController(name: '_GestureCrossStoreBase', context: context);

  @override
  dynamic incrementTapCount() {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.incrementTapCount');
    try {
      return super.incrementTapCount();
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHomeScreen() {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.setHomeScreen');
    try {
      return super.setHomeScreen();
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startBlinking() {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.startBlinking');
    try {
      return super.startBlinking();
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stopBlinking() {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.stopBlinking');
    try {
      return super.stopBlinking();
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleAll() {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.toggleAll');
    try {
      return super.toggleAll();
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCollaborationHomeScreen() {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.setCollaborationHomeScreen');
    try {
      return super.setCollaborationHomeScreen();
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initMoveAndRegenerate(Offset endDirection) {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.initMoveAndRegenerate');
    try {
      return super.initMoveAndRegenerate(endDirection);
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tapCount: ${tapCount}
    ''';
  }
}
