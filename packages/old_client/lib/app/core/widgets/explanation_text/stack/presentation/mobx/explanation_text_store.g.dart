// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explanation_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExplanationTextStore on _ExplanationTextStoreBase, Store {
  late final _$showWidgetAtom =
      Atom(name: '_ExplanationTextStoreBase.showWidget', context: context);

  @override
  bool get showWidget {
    _$showWidgetAtom.reportRead();
    return super.showWidget;
  }

  @override
  set showWidget(bool value) {
    _$showWidgetAtom.reportWrite(value, super.showWidget, () {
      super.showWidget = value;
    });
  }

  late final _$_ExplanationTextStoreBaseActionController =
      ActionController(name: '_ExplanationTextStoreBase', context: context);

  @override
  dynamic widgetConstructor({String message = ""}) {
    final _$actionInfo = _$_ExplanationTextStoreBaseActionController
        .startAction(name: '_ExplanationTextStoreBase.widgetConstructor');
    try {
      return super.widgetConstructor(message: message);
    } finally {
      _$_ExplanationTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleWidgetVisibility() {
    final _$actionInfo = _$_ExplanationTextStoreBaseActionController
        .startAction(name: '_ExplanationTextStoreBase.toggleWidgetVisibility');
    try {
      return super.toggleWidgetVisibility();
    } finally {
      _$_ExplanationTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showWidget: ${showWidget}
    ''';
  }
}
