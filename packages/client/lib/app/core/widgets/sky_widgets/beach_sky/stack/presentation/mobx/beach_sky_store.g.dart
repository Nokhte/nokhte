// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_sky_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachSkyStore on _BeachSkyStoreBase, Store {
  late final _$movieAtom =
      Atom(name: '_BeachSkyStoreBase.movie', context: context);

  @override
  MovieTween get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(MovieTween value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$skyValueAtom =
      Atom(name: '_BeachSkyStoreBase.skyValue', context: context);

  @override
  double get skyValue {
    _$skyValueAtom.reportRead();
    return super.skyValue;
  }

  @override
  set skyValue(double value) {
    _$skyValueAtom.reportWrite(value, super.skyValue, () {
      super.skyValue = value;
    });
  }

  late final _$pathAtom =
      Atom(name: '_BeachSkyStoreBase.path', context: context);

  @override
  Path get path {
    _$pathAtom.reportRead();
    return super.path;
  }

  @override
  set path(Path value) {
    _$pathAtom.reportWrite(value, super.path, () {
      super.path = value;
    });
  }

  late final _$rectAtom =
      Atom(name: '_BeachSkyStoreBase.rect', context: context);

  @override
  Rect get rect {
    _$rectAtom.reportRead();
    return super.rect;
  }

  @override
  set rect(Rect value) {
    _$rectAtom.reportWrite(value, super.rect, () {
      super.rect = value;
    });
  }

  late final _$controlAtom =
      Atom(name: '_BeachSkyStoreBase.control', context: context);

  @override
  Control get control {
    _$controlAtom.reportRead();
    return super.control;
  }

  @override
  set control(Control value) {
    _$controlAtom.reportWrite(value, super.control, () {
      super.control = value;
    });
  }

  late final _$_BeachSkyStoreBaseActionController =
      ActionController(name: '_BeachSkyStoreBase', context: context);

  @override
  dynamic setSkyValue(double newSkyValue) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.setSkyValue');
    try {
      return super.setSkyValue(newSkyValue);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPath(Rect newRect) {
    final _$actionInfo = _$_BeachSkyStoreBaseActionController.startAction(
        name: '_BeachSkyStoreBase.setPath');
    try {
      return super.setPath(newRect);
    } finally {
      _$_BeachSkyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
skyValue: ${skyValue},
path: ${path},
rect: ${rect},
control: ${control}
    ''';
  }
}
