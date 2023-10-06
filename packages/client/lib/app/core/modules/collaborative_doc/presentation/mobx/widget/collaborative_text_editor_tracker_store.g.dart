// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaborative_text_editor_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaborativeTextEditorTrackerStore
    on _CollaborativeTextEditorTrackerStoreBase, Store {
  late final _$showWidgetAtom = Atom(
      name: '_CollaborativeTextEditorTrackerStoreBase.showWidget',
      context: context);

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

  late final _$_CollaborativeTextEditorTrackerStoreBaseActionController =
      ActionController(
          name: '_CollaborativeTextEditorTrackerStoreBase', context: context);

  @override
  dynamic setText(String message) {
    final _$actionInfo =
        _$_CollaborativeTextEditorTrackerStoreBaseActionController.startAction(
            name: '_CollaborativeTextEditorTrackerStoreBase.setText');
    try {
      return super.setText(message);
    } finally {
      _$_CollaborativeTextEditorTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic flipWidgetVisibility() {
    final _$actionInfo =
        _$_CollaborativeTextEditorTrackerStoreBaseActionController.startAction(
            name:
                '_CollaborativeTextEditorTrackerStoreBase.flipWidgetVisibility');
    try {
      return super.flipWidgetVisibility();
    } finally {
      _$_CollaborativeTextEditorTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo =
        _$_CollaborativeTextEditorTrackerStoreBaseActionController.startAction(
            name: '_CollaborativeTextEditorTrackerStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CollaborativeTextEditorTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showWidget: ${showWidget}
    ''';
  }
}
