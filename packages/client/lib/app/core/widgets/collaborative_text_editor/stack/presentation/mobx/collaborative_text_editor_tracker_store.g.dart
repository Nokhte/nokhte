// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaborative_text_editor_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaborativeTextEditorTrackerStore
    on _CollaborativeTextEditorTrackerStoreBase, Store {
  late final _$controllerAtom = Atom(
      name: '_CollaborativeTextEditorTrackerStoreBase.controller',
      context: context);

  @override
  TextEditingController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(TextEditingController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$focusNodeAtom = Atom(
      name: '_CollaborativeTextEditorTrackerStoreBase.focusNode',
      context: context);

  @override
  FocusNode get focusNode {
    _$focusNodeAtom.reportRead();
    return super.focusNode;
  }

  @override
  set focusNode(FocusNode value) {
    _$focusNodeAtom.reportWrite(value, super.focusNode, () {
      super.focusNode = value;
    });
  }

  late final _$_CollaborativeTextEditorTrackerStoreBaseActionController =
      ActionController(
          name: '_CollaborativeTextEditorTrackerStoreBase', context: context);

  @override
  dynamic handleTap() {
    final _$actionInfo =
        _$_CollaborativeTextEditorTrackerStoreBaseActionController.startAction(
            name: '_CollaborativeTextEditorTrackerStoreBase.handleTap');
    try {
      return super.handleTap();
    } finally {
      _$_CollaborativeTextEditorTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic addEventListeners() {
    final _$actionInfo =
        _$_CollaborativeTextEditorTrackerStoreBaseActionController.startAction(
            name: '_CollaborativeTextEditorTrackerStoreBase.addEventListeners');
    try {
      return super.addEventListeners();
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
controller: ${controller},
focusNode: ${focusNode}
    ''';
  }
}
