// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaborator_pool_screen_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CollaboratorPoolScreenCoordinatorStore
    on _CollaboratorPoolScreenCoordinatorStoreBase, Store {
  late final _$canEnterTheCollaborationAtom = Atom(
      name:
          '_CollaboratorPoolScreenCoordinatorStoreBase.canEnterTheCollaboration',
      context: context);

  @override
  bool get canEnterTheCollaboration {
    _$canEnterTheCollaborationAtom.reportRead();
    return super.canEnterTheCollaboration;
  }

  @override
  set canEnterTheCollaboration(bool value) {
    _$canEnterTheCollaborationAtom
        .reportWrite(value, super.canEnterTheCollaboration, () {
      super.canEnterTheCollaboration = value;
    });
  }

  late final _$_CollaboratorPoolScreenCoordinatorStoreBaseActionController =
      ActionController(
          name: '_CollaboratorPoolScreenCoordinatorStoreBase',
          context: context);

  @override
  dynamic toggleCanEnterTheCollaboration() {
    final _$actionInfo =
        _$_CollaboratorPoolScreenCoordinatorStoreBaseActionController.startAction(
            name:
                '_CollaboratorPoolScreenCoordinatorStoreBase.toggleCanEnterTheCollaboration');
    try {
      return super.toggleCanEnterTheCollaboration();
    } finally {
      _$_CollaboratorPoolScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchStatusListener() {
    final _$actionInfo =
        _$_CollaboratorPoolScreenCoordinatorStoreBaseActionController.startAction(
            name:
                '_CollaboratorPoolScreenCoordinatorStoreBase.searchStatusListener');
    try {
      return super.searchStatusListener();
    } finally {
      _$_CollaboratorPoolScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic screenConstructorCallback() {
    final _$actionInfo =
        _$_CollaboratorPoolScreenCoordinatorStoreBaseActionController.startAction(
            name:
                '_CollaboratorPoolScreenCoordinatorStoreBase.screenConstructorCallback');
    try {
      return super.screenConstructorCallback();
    } finally {
      _$_CollaboratorPoolScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
canEnterTheCollaboration: ${canEnterTheCollaboration}
    ''';
  }
}
