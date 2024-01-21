// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solo_docs_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SoloDocsCoordinator on _SoloDocsCoordinatorBase, Store {
  late final _$isCreatedAtom =
      Atom(name: '_SoloDocsCoordinatorBase.isCreated', context: context);

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
      Atom(name: '_SoloDocsCoordinatorBase.isSealed', context: context);

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
      Atom(name: '_SoloDocsCoordinatorBase.isShared', context: context);

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
      Atom(name: '_SoloDocsCoordinatorBase.isSubmitted', context: context);

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
      Atom(name: '_SoloDocsCoordinatorBase.remoteDocContent', context: context);

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
      AsyncAction('_SoloDocsCoordinatorBase.create', context: context);

  @override
  Future create(SoloDocTypes params) {
    return _$createAsyncAction.run(() => super.create(params));
  }

  late final _$getDocAsyncAction =
      AsyncAction('_SoloDocsCoordinatorBase.getDoc', context: context);

  @override
  Future getDoc(GetSoloDocParams params) {
    return _$getDocAsyncAction.run(() => super.getDoc(params));
  }

  late final _$sealAsyncAction =
      AsyncAction('_SoloDocsCoordinatorBase.seal', context: context);

  @override
  Future seal() {
    return _$sealAsyncAction.run(() => super.seal());
  }

  late final _$shareAsyncAction =
      AsyncAction('_SoloDocsCoordinatorBase.share', context: context);

  @override
  Future share() {
    return _$shareAsyncAction.run(() => super.share());
  }

  late final _$submitAsyncAction =
      AsyncAction('_SoloDocsCoordinatorBase.submit', context: context);

  @override
  Future submit(String params) {
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
