// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gesture_cross_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GestureCrossStore on _GestureCrossStoreBase, Store {
  late final _$wantToFadeOutAtom =
      Atom(name: '_GestureCrossStoreBase.wantToFadeOut', context: context);

  @override
  bool get wantToFadeOut {
    _$wantToFadeOutAtom.reportRead();
    return super.wantToFadeOut;
  }

  @override
  set wantToFadeOut(bool value) {
    _$wantToFadeOutAtom.reportWrite(value, super.wantToFadeOut, () {
      super.wantToFadeOut = value;
    });
  }

  late final _$pillControllerAtom =
      Atom(name: '_GestureCrossStoreBase.pillController', context: context);

  @override
  Control get pillController {
    _$pillControllerAtom.reportRead();
    return super.pillController;
  }

  @override
  set pillController(Control value) {
    _$pillControllerAtom.reportWrite(value, super.pillController, () {
      super.pillController = value;
    });
  }

  late final _$_GestureCrossStoreBaseActionController =
      ActionController(name: '_GestureCrossStoreBase', context: context);

  @override
  dynamic setFadeOut(bool newFadeStatus) {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.setFadeOut');
    try {
      return super.setFadeOut(newFadeStatus);
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPillAnimationControl(Control newControl) {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.setPillAnimationControl');
    try {
      return super.setPillAnimationControl(newControl);
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPillMovie(MovieTween newMovie) {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.setPillMovie');
    try {
      return super.setPillMovie(newMovie);
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAnimationCompleted() {
    final _$actionInfo = _$_GestureCrossStoreBaseActionController.startAction(
        name: '_GestureCrossStoreBase.onAnimationCompleted');
    try {
      return super.onAnimationCompleted();
    } finally {
      _$_GestureCrossStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wantToFadeOut: ${wantToFadeOut},
pillController: ${pillController}
    ''';
  }
}
