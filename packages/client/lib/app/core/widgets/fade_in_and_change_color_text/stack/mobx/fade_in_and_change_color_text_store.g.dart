// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fade_in_and_change_color_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FadeInAndChangeColorTextStore
    on _FadeInAndChangeColorTextStoreBase, Store {
  late final _$currentMessageAtom = Atom(
      name: '_FadeInAndChangeColorTextStoreBase.currentMessage',
      context: context);

  @override
  String get currentMessage {
    _$currentMessageAtom.reportRead();
    return super.currentMessage;
  }

  @override
  set currentMessage(String value) {
    _$currentMessageAtom.reportWrite(value, super.currentMessage, () {
      super.currentMessage = value;
    });
  }

  late final _$movieModeAtom = Atom(
      name: '_FadeInAndChangeColorTextStoreBase.movieMode', context: context);

  @override
  FadeInTextMovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(FadeInTextMovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
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
  dynamic setCurrentMessage(String newMessage) {
    final _$actionInfo =
        _$_FadeInAndChangeColorTextStoreBaseActionController.startAction(
            name: '_FadeInAndChangeColorTextStoreBase.setCurrentMessage');
    try {
      return super.setCurrentMessage(newMessage);
    } finally {
      _$_FadeInAndChangeColorTextStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

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
currentMessage: ${currentMessage},
movieMode: ${movieMode},
currentColor: ${currentColor}
    ''';
  }
}
