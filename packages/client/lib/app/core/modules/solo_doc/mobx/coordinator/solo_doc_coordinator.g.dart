// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solo_doc_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SoloDocCoordinator on _SoloDocCoordinatorBase, Store {
  late final _$isCreatedAtom =
      Atom(name: '_SoloDocCoordinatorBase.isCreated', context: context);

  @override
  bool get isCreated {
    _$isCreatedAtom.reportRead();
    return super.isCreated;
  }

  @override
  set isCreated(bool value) {
    _$isCreatedAtom.reportWrite(value, super.isCreated, () {
      super.isCreated = value;
    });
  }

  late final _$isSealedAtom =
      Atom(name: '_SoloDocCoordinatorBase.isSealed', context: context);

  @override
  bool get isSealed {
    _$isSealedAtom.reportRead();
    return super.isSealed;
  }

  @override
  set isSealed(bool value) {
    _$isSealedAtom.reportWrite(value, super.isSealed, () {
      super.isSealed = value;
    });
  }

  late final _$isSharedAtom =
      Atom(name: '_SoloDocCoordinatorBase.isShared', context: context);

  @override
  bool get isShared {
    _$isSharedAtom.reportRead();
    return super.isShared;
  }

  @override
  set isShared(bool value) {
    _$isSharedAtom.reportWrite(value, super.isShared, () {
      super.isShared = value;
    });
  }

  late final _$isSubmittedAtom =
      Atom(name: '_SoloDocCoordinatorBase.isSubmitted', context: context);

  @override
  bool get isSubmitted {
    _$isSubmittedAtom.reportRead();
    return super.isSubmitted;
  }

  @override
  set isSubmitted(bool value) {
    _$isSubmittedAtom.reportWrite(value, super.isSubmitted, () {
      super.isSubmitted = value;
    });
  }

  late final _$remoteDocContentAtom =
      Atom(name: '_SoloDocCoordinatorBase.remoteDocContent', context: context);

  @override
  String get remoteDocContent {
    _$remoteDocContentAtom.reportRead();
    return super.remoteDocContent;
  }

  @override
  set remoteDocContent(String value) {
    _$remoteDocContentAtom.reportWrite(value, super.remoteDocContent, () {
      super.remoteDocContent = value;
    });
  }

  late final _$createAsyncAction =
      AsyncAction('_SoloDocCoordinatorBase.create', context: context);

  @override
  Future create(CreateSoloDocParams params) {
    return _$createAsyncAction.run(() => super.create(params));
  }

  late final _$getDocAsyncAction =
      AsyncAction('_SoloDocCoordinatorBase.getDoc', context: context);

  @override
  Future getDoc(GetSoloDocParams params) {
    return _$getDocAsyncAction.run(() => super.getDoc(params));
  }

  late final _$sealAsyncAction =
      AsyncAction('_SoloDocCoordinatorBase.seal', context: context);

  @override
  Future seal(NoParams params) {
    return _$sealAsyncAction.run(() => super.seal(params));
  }

  late final _$shareAsyncAction =
      AsyncAction('_SoloDocCoordinatorBase.share', context: context);

  @override
  Future share(NoParams params) {
    return _$shareAsyncAction.run(() => super.share(params));
  }

  late final _$submitAsyncAction =
      AsyncAction('_SoloDocCoordinatorBase.submit', context: context);

  @override
  Future submit(SubmitSoloDocParams params) {
    return _$submitAsyncAction.run(() => super.submit(params));
  }

  @override
  String toString() {
    return '''
isCreated: ${isCreated},
isSealed: ${isSealed},
isShared: ${isShared},
isSubmitted: ${isSubmitted},
remoteDocContent: ${remoteDocContent}
    ''';
  }
}
