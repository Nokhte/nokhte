// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailing_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TrailingTextStore on _TrailingTextStoreBase, Store {
  late final _$textSizeAtom =
      Atom(name: '_TrailingTextStoreBase.textSize', context: context);

  @override
  Size get textSize {
    _$textSizeAtom.reportRead();
    return super.textSize;
  }

  @override
  set textSize(Size value) {
    _$textSizeAtom.reportWrite(value, super.textSize, () {
      super.textSize = value;
    });
  }

  late final _$_TrailingTextStoreBaseActionController =
      ActionController(name: '_TrailingTextStoreBase', context: context);

  @override
  dynamic setTextSizeAndMovie(
      {required Size newTextSize,
      required TextRevealDirection newTextRevealDirection}) {
    final _$actionInfo = _$_TrailingTextStoreBaseActionController.startAction(
        name: '_TrailingTextStoreBase.setTextSizeAndMovie');
    try {
      return super.setTextSizeAndMovie(
          newTextSize: newTextSize,
          newTextRevealDirection: newTextRevealDirection);
    } finally {
      _$_TrailingTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textSize: ${textSize}
    ''';
  }
}
