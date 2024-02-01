// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_get_session_metadata_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseGetSessionMetadataStore<T>
    on _BaseGetSessionMetadataStoreBase<T>, Store {
  Computed<bool>? _$bothCollaboratorsAreInSyncAndOnlineComputed;

  @override
  bool get bothCollaboratorsAreInSyncAndOnline =>
      (_$bothCollaboratorsAreInSyncAndOnlineComputed ??= Computed<bool>(
              () => super.bothCollaboratorsAreInSyncAndOnline,
              name:
                  '_BaseGetSessionMetadataStoreBase.bothCollaboratorsAreInSyncAndOnline'))
          .value;
  Computed<bool>? _$collaboratorHasMovedOnComputed;

  @override
  bool get collaboratorHasMovedOn => (_$collaboratorHasMovedOnComputed ??=
          Computed<bool>(() => super.collaboratorHasMovedOn,
              name: '_BaseGetSessionMetadataStoreBase.collaboratorHasMovedOn'))
      .value;

  late final _$currentPhaseAtom = Atom(
      name: '_BaseGetSessionMetadataStoreBase.currentPhase', context: context);

  @override
  double get currentPhase {
    _$currentPhaseAtom.reportRead();
    return super.currentPhase;
  }

  @override
  set currentPhase(double value) {
    _$currentPhaseAtom.reportWrite(value, super.currentPhase, () {
      super.currentPhase = value;
    });
  }

  late final _$userPhaseAtom = Atom(
      name: '_BaseGetSessionMetadataStoreBase.userPhase', context: context);

  @override
  double get userPhase {
    _$userPhaseAtom.reportRead();
    return super.userPhase;
  }

  @override
  set userPhase(double value) {
    _$userPhaseAtom.reportWrite(value, super.userPhase, () {
      super.userPhase = value;
    });
  }

  late final _$collaboratorPhaseAtom = Atom(
      name: '_BaseGetSessionMetadataStoreBase.collaboratorPhase',
      context: context);

  @override
  double get collaboratorPhase {
    _$collaboratorPhaseAtom.reportRead();
    return super.collaboratorPhase;
  }

  @override
  set collaboratorPhase(double value) {
    _$collaboratorPhaseAtom.reportWrite(value, super.collaboratorPhase, () {
      super.collaboratorPhase = value;
    });
  }

  late final _$userIsOnlineAtom = Atom(
      name: '_BaseGetSessionMetadataStoreBase.userIsOnline', context: context);

  @override
  bool get userIsOnline {
    _$userIsOnlineAtom.reportRead();
    return super.userIsOnline;
  }

  @override
  set userIsOnline(bool value) {
    _$userIsOnlineAtom.reportWrite(value, super.userIsOnline, () {
      super.userIsOnline = value;
    });
  }

  late final _$userIsTalkingAtom = Atom(
      name: '_BaseGetSessionMetadataStoreBase.userIsTalking', context: context);

  @override
  bool get userIsTalking {
    _$userIsTalkingAtom.reportRead();
    return super.userIsTalking;
  }

  @override
  set userIsTalking(bool value) {
    _$userIsTalkingAtom.reportWrite(value, super.userIsTalking, () {
      super.userIsTalking = value;
    });
  }

  late final _$collaboratorIsOnlineAtom = Atom(
      name: '_BaseGetSessionMetadataStoreBase.collaboratorIsOnline',
      context: context);

  @override
  bool get collaboratorIsOnline {
    _$collaboratorIsOnlineAtom.reportRead();
    return super.collaboratorIsOnline;
  }

  @override
  set collaboratorIsOnline(bool value) {
    _$collaboratorIsOnlineAtom.reportWrite(value, super.collaboratorIsOnline,
        () {
      super.collaboratorIsOnline = value;
    });
  }

  late final _$collaboratorIsTalkingAtom = Atom(
      name: '_BaseGetSessionMetadataStoreBase.collaboratorIsTalking',
      context: context);

  @override
  bool get collaboratorIsTalking {
    _$collaboratorIsTalkingAtom.reportRead();
    return super.collaboratorIsTalking;
  }

  @override
  set collaboratorIsTalking(bool value) {
    _$collaboratorIsTalkingAtom.reportWrite(value, super.collaboratorIsTalking,
        () {
      super.collaboratorIsTalking = value;
    });
  }

  late final _$sessionMetadataAtom = Atom(
      name: '_BaseGetSessionMetadataStoreBase.sessionMetadata',
      context: context);

  @override
  ObservableStream<T> get sessionMetadata {
    _$sessionMetadataAtom.reportRead();
    return super.sessionMetadata;
  }

  @override
  set sessionMetadata(ObservableStream<T> value) {
    _$sessionMetadataAtom.reportWrite(value, super.sessionMetadata, () {
      super.sessionMetadata = value;
    });
  }

  late final _$_BaseGetSessionMetadataStoreBaseActionController =
      ActionController(
          name: '_BaseGetSessionMetadataStoreBase', context: context);

  @override
  dynamic setCurrentPhase(double newDouble) {
    final _$actionInfo = _$_BaseGetSessionMetadataStoreBaseActionController
        .startAction(name: '_BaseGetSessionMetadataStoreBase.setCurrentPhase');
    try {
      return super.setCurrentPhase(newDouble);
    } finally {
      _$_BaseGetSessionMetadataStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPhase: ${currentPhase},
userPhase: ${userPhase},
collaboratorPhase: ${collaboratorPhase},
userIsOnline: ${userIsOnline},
userIsTalking: ${userIsTalking},
collaboratorIsOnline: ${collaboratorIsOnline},
collaboratorIsTalking: ${collaboratorIsTalking},
sessionMetadata: ${sessionMetadata},
bothCollaboratorsAreInSyncAndOnline: ${bothCollaboratorsAreInSyncAndOnline},
collaboratorHasMovedOn: ${collaboratorHasMovedOn}
    ''';
  }
}
