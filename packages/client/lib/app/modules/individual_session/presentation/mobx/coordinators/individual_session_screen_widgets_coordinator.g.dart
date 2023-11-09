// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_session_screen_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IndividualSessionScreenWidgetsCoordinator
    on _IndividualSessionScreenWidgetsCoordinatorBase, Store {
  late final _$audioRecordingWaterVisibilityAtom = Atom(
      name:
          '_IndividualSessionScreenWidgetsCoordinatorBase.audioRecordingWaterVisibility',
      context: context);

  @override
  bool get audioRecordingWaterVisibility {
    _$audioRecordingWaterVisibilityAtom.reportRead();
    return super.audioRecordingWaterVisibility;
  }

  @override
  set audioRecordingWaterVisibility(bool value) {
    _$audioRecordingWaterVisibilityAtom
        .reportWrite(value, super.audioRecordingWaterVisibility, () {
      super.audioRecordingWaterVisibility = value;
    });
  }

  late final _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_IndividualSessionScreenWidgetsCoordinatorBase',
          context: context);

  @override
  dynamic toggleAudioRecordingWaterVisibility() {
    final _$actionInfo =
        _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_IndividualSessionScreenWidgetsCoordinatorBase.toggleAudioRecordingWaterVisibility');
    try {
      return super.toggleAudioRecordingWaterVisibility();
    } finally {
      _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic markUpOrDownTheAudioPlatform(int chosenAudioIndex,
      {required bool shouldMoveUp}) {
    final _$actionInfo =
        _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_IndividualSessionScreenWidgetsCoordinatorBase.markUpOrDownTheAudioPlatform');
    try {
      return super.markUpOrDownTheAudioPlatform(chosenAudioIndex,
          shouldMoveUp: shouldMoveUp);
    } finally {
      _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetAudioPlatform() {
    final _$actionInfo =
        _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_IndividualSessionScreenWidgetsCoordinatorBase.resetAudioPlatform');
    try {
      return super.resetAudioPlatform();
    } finally {
      _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic startWaterImmersion() {
    final _$actionInfo =
        _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_IndividualSessionScreenWidgetsCoordinatorBase.startWaterImmersion');
    try {
      return super.startWaterImmersion();
    } finally {
      _$_IndividualSessionScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
audioRecordingWaterVisibility: ${audioRecordingWaterVisibility}
    ''';
  }
}
