// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waiting_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WaitingTextStore on _WaitingTextStoreBase, Store {
  late final _$altMovieAtom =
      Atom(name: '_WaitingTextStoreBase.altMovie', context: context);

  @override
  MovieTween get altMovie {
    _$altMovieAtom.reportRead();
    return super.altMovie;
  }

  @override
  set altMovie(MovieTween value) {
    _$altMovieAtom.reportWrite(value, super.altMovie, () {
      super.altMovie = value;
    });
  }

  late final _$altControlAtom =
      Atom(name: '_WaitingTextStoreBase.altControl', context: context);

  @override
  Control get altControl {
    _$altControlAtom.reportRead();
    return super.altControl;
  }

  @override
  set altControl(Control value) {
    _$altControlAtom.reportWrite(value, super.altControl, () {
      super.altControl = value;
    });
  }

  late final _$_WaitingTextStoreBaseActionController =
      ActionController(name: '_WaitingTextStoreBase', context: context);

  @override
  dynamic setAltMovie(Duration timerLength) {
    final _$actionInfo = _$_WaitingTextStoreBaseActionController.startAction(
        name: '_WaitingTextStoreBase.setAltMovie');
    try {
      return super.setAltMovie(timerLength);
    } finally {
      _$_WaitingTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAltControl(Control control) {
    final _$actionInfo = _$_WaitingTextStoreBaseActionController.startAction(
        name: '_WaitingTextStoreBase.setAltControl');
    try {
      return super.setAltControl(control);
    } finally {
      _$_WaitingTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
altMovie: ${altMovie},
altControl: ${altControl}
    ''';
  }
}
