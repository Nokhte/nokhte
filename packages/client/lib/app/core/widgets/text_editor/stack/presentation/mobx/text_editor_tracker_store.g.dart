// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_editor_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextEditorTrackerStore on _TextEditorTrackerStoreBase, Store {
  late final _$controllerAtom =
      Atom(name: '_TextEditorTrackerStoreBase.controller', context: context);

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

  late final _$focusNodeAtom =
      Atom(name: '_TextEditorTrackerStoreBase.focusNode', context: context);

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

  late final _$_TextEditorTrackerStoreBaseActionController =
      ActionController(name: '_TextEditorTrackerStoreBase', context: context);

  @override
  dynamic handleTap() {
    final _$actionInfo = _$_TextEditorTrackerStoreBaseActionController
        .startAction(name: '_TextEditorTrackerStoreBase.handleTap');
    try {
      return super.handleTap();
    } finally {
      _$_TextEditorTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addEventListeners() {
    final _$actionInfo = _$_TextEditorTrackerStoreBaseActionController
        .startAction(name: '_TextEditorTrackerStoreBase.addEventListeners');
    try {
      return super.addEventListeners();
    } finally {
      _$_TextEditorTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_TextEditorTrackerStoreBaseActionController
        .startAction(name: '_TextEditorTrackerStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_TextEditorTrackerStoreBaseActionController.endAction(_$actionInfo);
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
