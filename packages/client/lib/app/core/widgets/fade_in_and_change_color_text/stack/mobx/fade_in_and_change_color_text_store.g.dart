// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fade_in_and_change_color_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FadeInAndChangeColorTextStore
    on _FadeInAndChangeColorTextStoreBase, Store {
  late final _$movieAtom =
      Atom(name: '_FadeInAndChangeColorTextStoreBase.movie', context: context);

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

  late final _$movieModeAtom = Atom(
      name: '_FadeInAndChangeColorTextStoreBase.movieMode', context: context);

  @override
  MovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(MovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
    });
  }

  late final _$controlAtom = Atom(
      name: '_FadeInAndChangeColorTextStoreBase.control', context: context);

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

  late final _$currentColorAtom = Atom(
      name: '_FadeInAndChangeColorTextStoreBase.currentColor',
      context: context);

  @override
  Color get currentColor {
    _$currentColorAtom.reportRead();
    return super.currentColor;
  }

  @override
  set currentColor(Color value) {
    _$currentColorAtom.reportWrite(value, super.currentColor, () {
      super.currentColor = value;
    });
  }

  late final _$_FadeInAndChangeColorTextStoreBaseActionController =
      ActionController(
          name: '_FadeInAndChangeColorTextStoreBase', context: context);

  @override
  dynamic initiateFadeOut() {
    final _$actionInfo =
        _$_FadeInAndChangeColorTextStoreBaseActionController.startAction(
            name: '_FadeInAndChangeColorTextStoreBase.initiateFadeOut');
    try {
      return super.initiateFadeOut();
    } finally {
      _$_FadeInAndChangeColorTextStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic teeUpFadeOut() {
    final _$actionInfo = _$_FadeInAndChangeColorTextStoreBaseActionController
        .startAction(name: '_FadeInAndChangeColorTextStoreBase.teeUpFadeOut');
    try {
      return super.teeUpFadeOut();
    } finally {
      _$_FadeInAndChangeColorTextStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
movieMode: ${movieMode},
control: ${control},
currentColor: ${currentColor}
    ''';
  }
}
