// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_session_screen_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IndividualSessionScreenCoordinatorStore
    on _IndividualSessionScreenCoordinatorStoreBase, Store {
  Computed<String>? _$currentPerspectiveComputed;

  @override
  String get currentPerspective => (_$currentPerspectiveComputed ??= Computed<
              String>(() => super.currentPerspective,
          name:
              '_IndividualSessionScreenCoordinatorStoreBase.currentPerspective'))
      .value;

  late final _$screenTypeAtom = Atom(
      name: '_IndividualSessionScreenCoordinatorStoreBase.screenType',
      context: context);

  @override
  IndividualSessionScreenType get screenType {
    _$screenTypeAtom.reportRead();
    return super.screenType;
  }

  @override
  set screenType(IndividualSessionScreenType value) {
    _$screenTypeAtom.reportWrite(value, super.screenType, () {
      super.screenType = value;
    });
  }

  late final _$chosenAudioIndexAtom = Atom(
      name: '_IndividualSessionScreenCoordinatorStoreBase.chosenAudioIndex',
      context: context);

  @override
  int get chosenAudioIndex {
    _$chosenAudioIndexAtom.reportRead();
    return super.chosenAudioIndex;
  }

  @override
  set chosenAudioIndex(int value) {
    _$chosenAudioIndexAtom.reportWrite(value, super.chosenAudioIndex, () {
      super.chosenAudioIndex = value;
    });
  }

  late final _$hasntRecordedForAudioIndexAtom = Atom(
      name:
          '_IndividualSessionScreenCoordinatorStoreBase.hasntRecordedForAudioIndex',
      context: context);

  @override
  bool get hasntRecordedForAudioIndex {
    _$hasntRecordedForAudioIndexAtom.reportRead();
    return super.hasntRecordedForAudioIndex;
  }

  @override
  set hasntRecordedForAudioIndex(bool value) {
    _$hasntRecordedForAudioIndexAtom
        .reportWrite(value, super.hasntRecordedForAudioIndex, () {
      super.hasntRecordedForAudioIndex = value;
    });
  }

  late final _$currentPathAtom = Atom(
      name: '_IndividualSessionScreenCoordinatorStoreBase.currentPath',
      context: context);

  @override
  String get currentPath {
    _$currentPathAtom.reportRead();
    return super.currentPath;
  }

  @override
  set currentPath(String value) {
    _$currentPathAtom.reportWrite(value, super.currentPath, () {
      super.currentPath = value;
    });
  }

  late final _$formattedPerspectiveAtom = Atom(
      name: '_IndividualSessionScreenCoordinatorStoreBase.formattedPerspective',
      context: context);

  @override
  String get formattedPerspective {
    _$formattedPerspectiveAtom.reportRead();
    return super.formattedPerspective;
  }

  @override
  set formattedPerspective(String value) {
    _$formattedPerspectiveAtom.reportWrite(value, super.formattedPerspective,
        () {
      super.formattedPerspective = value;
    });
  }

  late final _$fileNameAtom = Atom(
      name: '_IndividualSessionScreenCoordinatorStoreBase.fileName',
      context: context);

  @override
  String get fileName {
    _$fileNameAtom.reportRead();
    return super.fileName;
  }

  @override
  set fileName(String value) {
    _$fileNameAtom.reportWrite(value, super.fileName, () {
      super.fileName = value;
    });
  }

  late final _$thePerspectivesAtom = Atom(
      name: '_IndividualSessionScreenCoordinatorStoreBase.thePerspectives',
      context: context);

  @override
  ObservableList<String> get thePerspectives {
    _$thePerspectivesAtom.reportRead();
    return super.thePerspectives;
  }

  @override
  set thePerspectives(ObservableList<String> value) {
    _$thePerspectivesAtom.reportWrite(value, super.thePerspectives, () {
      super.thePerspectives = value;
    });
  }

  late final _$numberOfFilesAtom = Atom(
      name: '_IndividualSessionScreenCoordinatorStoreBase.numberOfFiles',
      context: context);

  @override
  ObservableList<int> get numberOfFiles {
    _$numberOfFilesAtom.reportRead();
    return super.numberOfFiles;
  }

  @override
  set numberOfFiles(ObservableList<int> value) {
    _$numberOfFilesAtom.reportWrite(value, super.numberOfFiles, () {
      super.numberOfFiles = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_IndividualSessionScreenCoordinatorStoreBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$startRecordingAudioClipAsyncAction = AsyncAction(
      '_IndividualSessionScreenCoordinatorStoreBase.startRecordingAudioClip',
      context: context);

  @override
  Future startRecordingAudioClip() {
    return _$startRecordingAudioClipAsyncAction
        .run(() => super.startRecordingAudioClip());
  }

  late final _$stopRecordingAudioClipAsyncAction = AsyncAction(
      '_IndividualSessionScreenCoordinatorStoreBase.stopRecordingAudioClip',
      context: context);

  @override
  Future stopRecordingAudioClip() {
    return _$stopRecordingAudioClipAsyncAction
        .run(() => super.stopRecordingAudioClip());
  }

  late final _$_IndividualSessionScreenCoordinatorStoreBaseActionController =
      ActionController(
          name: '_IndividualSessionScreenCoordinatorStoreBase',
          context: context);

  @override
  dynamic setChosenAudioIndex(int newVal) {
    final _$actionInfo =
        _$_IndividualSessionScreenCoordinatorStoreBaseActionController.startAction(
            name:
                '_IndividualSessionScreenCoordinatorStoreBase.setChosenAudioIndex');
    try {
      return super.setChosenAudioIndex(newVal);
    } finally {
      _$_IndividualSessionScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic audioPlatformIndexMarkUp() {
    final _$actionInfo =
        _$_IndividualSessionScreenCoordinatorStoreBaseActionController.startAction(
            name:
                '_IndividualSessionScreenCoordinatorStoreBase.audioPlatformIndexMarkUp');
    try {
      return super.audioPlatformIndexMarkUp();
    } finally {
      _$_IndividualSessionScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic transitionToRecordingMode() {
    final _$actionInfo =
        _$_IndividualSessionScreenCoordinatorStoreBaseActionController.startAction(
            name:
                '_IndividualSessionScreenCoordinatorStoreBase.transitionToRecordingMode');
    try {
      return super.transitionToRecordingMode();
    } finally {
      _$_IndividualSessionScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic transitionToPerspectivesMode() {
    final _$actionInfo =
        _$_IndividualSessionScreenCoordinatorStoreBaseActionController.startAction(
            name:
                '_IndividualSessionScreenCoordinatorStoreBase.transitionToPerspectivesMode');
    try {
      return super.transitionToPerspectivesMode();
    } finally {
      _$_IndividualSessionScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenType: ${screenType},
chosenAudioIndex: ${chosenAudioIndex},
hasntRecordedForAudioIndex: ${hasntRecordedForAudioIndex},
currentPath: ${currentPath},
formattedPerspective: ${formattedPerspective},
fileName: ${fileName},
thePerspectives: ${thePerspectives},
numberOfFiles: ${numberOfFiles},
currentPerspective: ${currentPerspective}
    ''';
  }
}
