// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_collaborative_text_editor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseCollaborativeTextEditorStore
    on _BaseCollaborativeTextEditorStoreBase, Store {
  late final _$isInitialLoadAtom = Atom(
      name: '_BaseCollaborativeTextEditorStoreBase.isInitialLoad',
      context: context);

  @override
  bool get isInitialLoad {
    _$isInitialLoadAtom.reportRead();
    return super.isInitialLoad;
  }

  @override
  set isInitialLoad(bool value) {
    _$isInitialLoadAtom.reportWrite(value, super.isInitialLoad, () {
      super.isInitialLoad = value;
    });
  }

  late final _$wantsToCommitAtom = Atom(
      name: '_BaseCollaborativeTextEditorStoreBase.wantsToCommit',
      context: context);

  @override
  bool get wantsToCommit {
    _$wantsToCommitAtom.reportRead();
    return super.wantsToCommit;
  }

  @override
  set wantsToCommit(bool value) {
    _$wantsToCommitAtom.reportWrite(value, super.wantsToCommit, () {
      super.wantsToCommit = value;
    });
  }

  late final _$mostRecentDocInfoContentAtom = Atom(
      name: '_BaseCollaborativeTextEditorStoreBase.mostRecentDocInfoContent',
      context: context);

  @override
  DocInfoContent get mostRecentDocInfoContent {
    _$mostRecentDocInfoContentAtom.reportRead();
    return super.mostRecentDocInfoContent;
  }

  @override
  set mostRecentDocInfoContent(DocInfoContent value) {
    _$mostRecentDocInfoContentAtom
        .reportWrite(value, super.mostRecentDocInfoContent, () {
      super.mostRecentDocInfoContent = value;
    });
  }

  late final _$blockUserControllerCallbackAtom = Atom(
      name: '_BaseCollaborativeTextEditorStoreBase.blockUserControllerCallback',
      context: context);

  @override
  bool get blockUserControllerCallback {
    _$blockUserControllerCallbackAtom.reportRead();
    return super.blockUserControllerCallback;
  }

  @override
  set blockUserControllerCallback(bool value) {
    _$blockUserControllerCallbackAtom
        .reportWrite(value, super.blockUserControllerCallback, () {
      super.blockUserControllerCallback = value;
    });
  }

  late final _$blockUpdateTextUICallbackAtom = Atom(
      name: '_BaseCollaborativeTextEditorStoreBase.blockUpdateTextUICallback',
      context: context);

  @override
  bool get blockUpdateTextUICallback {
    _$blockUpdateTextUICallbackAtom.reportRead();
    return super.blockUpdateTextUICallback;
  }

  @override
  set blockUpdateTextUICallback(bool value) {
    _$blockUpdateTextUICallbackAtom
        .reportWrite(value, super.blockUpdateTextUICallback, () {
      super.blockUpdateTextUICallback = value;
    });
  }

  late final _$userTextControllerListenerAsyncAction = AsyncAction(
      '_BaseCollaborativeTextEditorStoreBase.userTextControllerListener',
      context: context);

  @override
  Future userTextControllerListener(
      {required CollaborativeDocCoordinator collaborativeDocDB}) {
    return _$userTextControllerListenerAsyncAction.run(() => super
        .userTextControllerListener(collaborativeDocDB: collaborativeDocDB));
  }

  late final _$updateTextUIAsyncAction = AsyncAction(
      '_BaseCollaborativeTextEditorStoreBase.updateTextUI',
      context: context);

  @override
  Future updateTextUI(DocInfoContent value) {
    return _$updateTextUIAsyncAction.run(() => super.updateTextUI(value));
  }

  late final _$_BaseCollaborativeTextEditorStoreBaseActionController =
      ActionController(
          name: '_BaseCollaborativeTextEditorStoreBase', context: context);

  @override
  dynamic setMostRecentDocInfoContent(DocInfoContent newDocContent) {
    final _$actionInfo =
        _$_BaseCollaborativeTextEditorStoreBaseActionController.startAction(
            name:
                '_BaseCollaborativeTextEditorStoreBase.setMostRecentDocInfoContent');
    try {
      return super.setMostRecentDocInfoContent(newDocContent);
    } finally {
      _$_BaseCollaborativeTextEditorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWantsToCommit(bool newCommitStatus) {
    final _$actionInfo =
        _$_BaseCollaborativeTextEditorStoreBaseActionController.startAction(
            name: '_BaseCollaborativeTextEditorStoreBase.setWantsToCommit');
    try {
      return super.setWantsToCommit(newCommitStatus);
    } finally {
      _$_BaseCollaborativeTextEditorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsInitialLoad() {
    final _$actionInfo =
        _$_BaseCollaborativeTextEditorStoreBaseActionController.startAction(
            name: '_BaseCollaborativeTextEditorStoreBase.toggleIsInitialLoad');
    try {
      return super.toggleIsInitialLoad();
    } finally {
      _$_BaseCollaborativeTextEditorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleBlockUserControllerCallback() {
    final _$actionInfo =
        _$_BaseCollaborativeTextEditorStoreBaseActionController.startAction(
            name:
                '_BaseCollaborativeTextEditorStoreBase.toggleBlockUserControllerCallback');
    try {
      return super.toggleBlockUserControllerCallback();
    } finally {
      _$_BaseCollaborativeTextEditorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleBlockUpdateTextUICallback() {
    final _$actionInfo =
        _$_BaseCollaborativeTextEditorStoreBaseActionController.startAction(
            name:
                '_BaseCollaborativeTextEditorStoreBase.toggleBlockUpdateTextUICallback');
    try {
      return super.toggleBlockUpdateTextUICallback();
    } finally {
      _$_BaseCollaborativeTextEditorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCommitStatusToAffirmative() {
    final _$actionInfo =
        _$_BaseCollaborativeTextEditorStoreBaseActionController.startAction(
            name:
                '_BaseCollaborativeTextEditorStoreBase.updateCommitStatusToAffirmative');
    try {
      return super.updateCommitStatusToAffirmative();
    } finally {
      _$_BaseCollaborativeTextEditorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isInitialLoad: ${isInitialLoad},
wantsToCommit: ${wantsToCommit},
mostRecentDocInfoContent: ${mostRecentDocInfoContent},
blockUserControllerCallback: ${blockUserControllerCallback},
blockUpdateTextUICallback: ${blockUpdateTextUICallback}
    ''';
  }
}
