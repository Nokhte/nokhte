// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_collaboration_artifacts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeleteCollaborationArtifactsStore
    on _DeleteCollaborationArtifactsStoreBase, Store {
  late final _$collaborationIsDeletedAtom = Atom(
      name: '_DeleteCollaborationArtifactsStoreBase.collaborationIsDeleted',
      context: context);

  @override
  bool get collaborationIsDeleted {
    _$collaborationIsDeletedAtom.reportRead();
    return super.collaborationIsDeleted;
  }

  @override
  set collaborationIsDeleted(bool value) {
    _$collaborationIsDeletedAtom
        .reportWrite(value, super.collaborationIsDeleted, () {
      super.collaborationIsDeleted = value;
    });
  }

  late final _$soloDocumentIsDeletedAtom = Atom(
      name: '_DeleteCollaborationArtifactsStoreBase.soloDocumentIsDeleted',
      context: context);

  @override
  bool get soloDocumentIsDeleted {
    _$soloDocumentIsDeletedAtom.reportRead();
    return super.soloDocumentIsDeleted;
  }

  @override
  set soloDocumentIsDeleted(bool value) {
    _$soloDocumentIsDeletedAtom.reportWrite(value, super.soloDocumentIsDeleted,
        () {
      super.soloDocumentIsDeleted = value;
    });
  }

  late final _$capsuleArrangementIsDeletedAtom = Atom(
      name:
          '_DeleteCollaborationArtifactsStoreBase.capsuleArrangementIsDeleted',
      context: context);

  @override
  bool get capsuleArrangementIsDeleted {
    _$capsuleArrangementIsDeletedAtom.reportRead();
    return super.capsuleArrangementIsDeleted;
  }

  @override
  set capsuleArrangementIsDeleted(bool value) {
    _$capsuleArrangementIsDeletedAtom
        .reportWrite(value, super.capsuleArrangementIsDeleted, () {
      super.capsuleArrangementIsDeleted = value;
    });
  }

  late final _$collaborativeDocumentIsDeletedAtom = Atom(
      name:
          '_DeleteCollaborationArtifactsStoreBase.collaborativeDocumentIsDeleted',
      context: context);

  @override
  bool get collaborativeDocumentIsDeleted {
    _$collaborativeDocumentIsDeletedAtom.reportRead();
    return super.collaborativeDocumentIsDeleted;
  }

  @override
  set collaborativeDocumentIsDeleted(bool value) {
    _$collaborativeDocumentIsDeletedAtom
        .reportWrite(value, super.collaborativeDocumentIsDeleted, () {
      super.collaborativeDocumentIsDeleted = value;
    });
  }

  late final _$schedulingSessionIsDeletedAtom = Atom(
      name: '_DeleteCollaborationArtifactsStoreBase.schedulingSessionIsDeleted',
      context: context);

  @override
  bool get schedulingSessionIsDeleted {
    _$schedulingSessionIsDeletedAtom.reportRead();
    return super.schedulingSessionIsDeleted;
  }

  @override
  set schedulingSessionIsDeleted(bool value) {
    _$schedulingSessionIsDeletedAtom
        .reportWrite(value, super.schedulingSessionIsDeleted, () {
      super.schedulingSessionIsDeleted = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_DeleteCollaborationArtifactsStoreBase.call',
      context: context);

  @override
  Future<void> call(PurposeSessionScreen params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
collaborationIsDeleted: ${collaborationIsDeleted},
soloDocumentIsDeleted: ${soloDocumentIsDeleted},
capsuleArrangementIsDeleted: ${capsuleArrangementIsDeleted},
collaborativeDocumentIsDeleted: ${collaborativeDocumentIsDeleted},
schedulingSessionIsDeleted: ${schedulingSessionIsDeleted}
    ''';
  }
}
