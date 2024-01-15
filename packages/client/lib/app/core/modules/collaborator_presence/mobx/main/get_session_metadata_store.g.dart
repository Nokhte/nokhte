// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_session_metadata_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetSessionMetadataStore on _GetSessionMetadataStoreBase, Store {
  Computed<bool>? _$bothCollaboratorsAreOnCallAndOnlineComputed;

  @override
  bool get bothCollaboratorsAreOnCallAndOnline =>
      (_$bothCollaboratorsAreOnCallAndOnlineComputed ??= Computed<bool>(
              () => super.bothCollaboratorsAreOnCallAndOnline,
              name:
                  '_GetSessionMetadataStoreBase.bothCollaboratorsAreOnCallAndOnline'))
          .value;

  late final _$userIsOnCallAtom =
      Atom(name: '_GetSessionMetadataStoreBase.userIsOnCall', context: context);

  @override
  bool get userIsOnCall {
    _$userIsOnCallAtom.reportRead();
    return super.userIsOnCall;
  }

  @override
  set userIsOnCall(bool value) {
    _$userIsOnCallAtom.reportWrite(value, super.userIsOnCall, () {
      super.userIsOnCall = value;
    });
  }

  late final _$collaboratorIsOnCallAtom = Atom(
      name: '_GetSessionMetadataStoreBase.collaboratorIsOnCall',
      context: context);

  @override
  bool get collaboratorIsOnCall {
    _$collaboratorIsOnCallAtom.reportRead();
    return super.collaboratorIsOnCall;
  }

  @override
  set collaboratorIsOnCall(bool value) {
    _$collaboratorIsOnCallAtom.reportWrite(value, super.collaboratorIsOnCall,
        () {
      super.collaboratorIsOnCall = value;
    });
  }

  late final _$userIsOnlineAtom =
      Atom(name: '_GetSessionMetadataStoreBase.userIsOnline', context: context);

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

  late final _$collaboratorIsOnlineAtom = Atom(
      name: '_GetSessionMetadataStoreBase.collaboratorIsOnline',
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

  late final _$timerShouldRunAtom = Atom(
      name: '_GetSessionMetadataStoreBase.timerShouldRun', context: context);

  @override
  bool get timerShouldRun {
    _$timerShouldRunAtom.reportRead();
    return super.timerShouldRun;
  }

  @override
  set timerShouldRun(bool value) {
    _$timerShouldRunAtom.reportWrite(value, super.timerShouldRun, () {
      super.timerShouldRun = value;
    });
  }

  late final _$collaboratorIsTalkingAtom = Atom(
      name: '_GetSessionMetadataStoreBase.collaboratorIsTalking',
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
      name: '_GetSessionMetadataStoreBase.sessionMetadata', context: context);

  @override
  ObservableStream<CollaborationSessionMetadata> get sessionMetadata {
    _$sessionMetadataAtom.reportRead();
    return super.sessionMetadata;
  }

  @override
  set sessionMetadata(ObservableStream<CollaborationSessionMetadata> value) {
    _$sessionMetadataAtom.reportWrite(value, super.sessionMetadata, () {
      super.sessionMetadata = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetSessionMetadataStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
userIsOnCall: ${userIsOnCall},
collaboratorIsOnCall: ${collaboratorIsOnCall},
userIsOnline: ${userIsOnline},
collaboratorIsOnline: ${collaboratorIsOnline},
timerShouldRun: ${timerShouldRun},
collaboratorIsTalking: ${collaboratorIsTalking},
sessionMetadata: ${sessionMetadata},
bothCollaboratorsAreOnCallAndOnline: ${bothCollaboratorsAreOnCallAndOnline}
    ''';
  }
}
