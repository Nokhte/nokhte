// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_editor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextEditorStore on _TextEditorStoreBase, Store {
  late final _$controllerAtom =
      Atom(name: '_TextEditorStoreBase.controller', context: context);

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
      Atom(name: '_TextEditorStoreBase.focusNode', context: context);

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

  late final _$isReadOnlyAtom =
      Atom(name: '_TextEditorStoreBase.isReadOnly', context: context);

  @override
  bool get isReadOnly {
    _$isReadOnlyAtom.reportRead();
    return super.isReadOnly;
  }

  @override
  set isReadOnly(bool value) {
    _$isReadOnlyAtom.reportWrite(value, super.isReadOnly, () {
      super.isReadOnly = value;
    });
  }

  late final _$_TextEditorStoreBaseActionController =
      ActionController(name: '_TextEditorStoreBase', context: context);

  @override
  dynamic setText(String newContent) {
    final _$actionInfo = _$_TextEditorStoreBaseActionController.startAction(
        name: '_TextEditorStoreBase.setText');
    try {
      return super.setText(newContent);
    } finally {
      _$_TextEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic handleTap() {
    final _$actionInfo = _$_TextEditorStoreBaseActionController.startAction(
        name: '_TextEditorStoreBase.handleTap');
    try {
      return super.handleTap();
    } finally {
      _$_TextEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsReadOnly(bool newBool) {
    final _$actionInfo = _$_TextEditorStoreBaseActionController.startAction(
        name: '_TextEditorStoreBase.setIsReadOnly');
    try {
      return super.setIsReadOnly(newBool);
    } finally {
      _$_TextEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addEventListeners() {
    final _$actionInfo = _$_TextEditorStoreBaseActionController.startAction(
        name: '_TextEditorStoreBase.addEventListeners');
    try {
      return super.addEventListeners();
    } finally {
      _$_TextEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_TextEditorStoreBaseActionController.startAction(
        name: '_TextEditorStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_TextEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controller: ${controller},
focusNode: ${focusNode},
isReadOnly: ${isReadOnly}
    ''';
  }
}
