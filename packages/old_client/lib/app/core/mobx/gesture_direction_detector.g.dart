// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gesture_direction_detector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GestureDirectionDetector on _GestureDirectionDetector, Store {
  late final _$mostRecentCoordinatesAtom = Atom(
      name: '_GestureDirectionDetector.mostRecentCoordinates',
      context: context);

  @override
  ObservableList<Offset> get mostRecentCoordinates {
    _$mostRecentCoordinatesAtom.reportRead();
    return super.mostRecentCoordinates;
  }

  @override
  set mostRecentCoordinates(ObservableList<Offset> value) {
    _$mostRecentCoordinatesAtom.reportWrite(value, super.mostRecentCoordinates,
        () {
      super.mostRecentCoordinates = value;
    });
  }

  late final _$dragTypeAtom =
      Atom(name: '_GestureDirectionDetector.dragType', context: context);

  @override
  DragType get dragType {
    _$dragTypeAtom.reportRead();
    return super.dragType;
  }

  @override
  set dragType(DragType value) {
    _$dragTypeAtom.reportWrite(value, super.dragType, () {
      super.dragType = value;
    });
  }

  late final _$directionsTypeAtom =
      Atom(name: '_GestureDirectionDetector.directionsType', context: context);

  @override
  GestureDirections get directionsType {
    _$directionsTypeAtom.reportRead();
    return super.directionsType;
  }

  @override
  set directionsType(GestureDirections value) {
    _$directionsTypeAtom.reportWrite(value, super.directionsType, () {
      super.directionsType = value;
    });
  }

  late final _$_GestureDirectionDetectorActionController =
      ActionController(name: '_GestureDirectionDetector', context: context);

  @override
  dynamic setDragType(DragType newDragType) {
    final _$actionInfo = _$_GestureDirectionDetectorActionController
        .startAction(name: '_GestureDirectionDetector.setDragType');
    try {
      return super.setDragType(newDragType);
    } finally {
      _$_GestureDirectionDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onUpdateCallback(Offset mostRecentOffset, DragType newDragType) {
    final _$actionInfo = _$_GestureDirectionDetectorActionController
        .startAction(name: '_GestureDirectionDetector.onUpdateCallback');
    try {
      return super.onUpdateCallback(mostRecentOffset, newDragType);
    } finally {
      _$_GestureDirectionDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetDirectionsType() {
    final _$actionInfo = _$_GestureDirectionDetectorActionController
        .startAction(name: '_GestureDirectionDetector.resetDirectionsType');
    try {
      return super.resetDirectionsType();
    } finally {
      _$_GestureDirectionDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onFinishedGestureCallback() {
    final _$actionInfo =
        _$_GestureDirectionDetectorActionController.startAction(
            name: '_GestureDirectionDetector.onFinishedGestureCallback');
    try {
      return super.onFinishedGestureCallback();
    } finally {
      _$_GestureDirectionDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mostRecentCoordinates: ${mostRecentCoordinates},
dragType: ${dragType},
directionsType: ${directionsType}
    ''';
  }
}
