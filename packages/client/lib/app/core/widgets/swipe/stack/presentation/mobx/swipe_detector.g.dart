// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swipe_detector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SwipeDetector on _SwipeDetector, Store {
  late final _$mostRecentCoordinatesAtom =
      Atom(name: '_SwipeDetector.mostRecentCoordinates', context: context);

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

  late final _$tapCountAtom =
      Atom(name: '_SwipeDetector.tapCount', context: context);

  @override
  int get tapCount {
    _$tapCountAtom.reportRead();
    return super.tapCount;
  }

  @override
  set tapCount(int value) {
    _$tapCountAtom.reportWrite(value, super.tapCount, () {
      super.tapCount = value;
    });
  }

  late final _$holdCountAtom =
      Atom(name: '_SwipeDetector.holdCount', context: context);

  @override
  int get holdCount {
    _$holdCountAtom.reportRead();
    return super.holdCount;
  }

  @override
  set holdCount(int value) {
    _$holdCountAtom.reportWrite(value, super.holdCount, () {
      super.holdCount = value;
    });
  }

  late final _$dragTypeAtom =
      Atom(name: '_SwipeDetector.dragType', context: context);

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
      Atom(name: '_SwipeDetector.directionsType', context: context);

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

  late final _$resetTheDirectionTypeAtom =
      Atom(name: '_SwipeDetector.resetTheDirectionType', context: context);

  @override
  bool get resetTheDirectionType {
    _$resetTheDirectionTypeAtom.reportRead();
    return super.resetTheDirectionType;
  }

  @override
  set resetTheDirectionType(bool value) {
    _$resetTheDirectionTypeAtom.reportWrite(value, super.resetTheDirectionType,
        () {
      super.resetTheDirectionType = value;
    });
  }

  late final _$holdStateAtom =
      Atom(name: '_SwipeDetector.holdState', context: context);

  @override
  HoldState get holdState {
    _$holdStateAtom.reportRead();
    return super.holdState;
  }

  @override
  set holdState(HoldState value) {
    _$holdStateAtom.reportWrite(value, super.holdState, () {
      super.holdState = value;
    });
  }

  late final _$hasAlreadyMadeGestureAtom =
      Atom(name: '_SwipeDetector.hasAlreadyMadeGesture', context: context);

  @override
  bool get hasAlreadyMadeGesture {
    _$hasAlreadyMadeGestureAtom.reportRead();
    return super.hasAlreadyMadeGesture;
  }

  @override
  set hasAlreadyMadeGesture(bool value) {
    _$hasAlreadyMadeGestureAtom.reportWrite(value, super.hasAlreadyMadeGesture,
        () {
      super.hasAlreadyMadeGesture = value;
    });
  }

  late final _$_SwipeDetectorActionController =
      ActionController(name: '_SwipeDetector', context: context);

  @override
  dynamic setDirectionsType(GestureDirections newDirectionsType) {
    final _$actionInfo = _$_SwipeDetectorActionController.startAction(
        name: '_SwipeDetector.setDirectionsType');
    try {
      return super.setDirectionsType(newDirectionsType);
    } finally {
      _$_SwipeDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDragType(DragType newDragType) {
    final _$actionInfo = _$_SwipeDetectorActionController.startAction(
        name: '_SwipeDetector.setDragType');
    try {
      return super.setDragType(newDragType);
    } finally {
      _$_SwipeDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onUpdateCallback(Offset mostRecentOffset, DragType newDragType) {
    final _$actionInfo = _$_SwipeDetectorActionController.startAction(
        name: '_SwipeDetector.onUpdateCallback');
    try {
      return super.onUpdateCallback(mostRecentOffset, newDragType);
    } finally {
      _$_SwipeDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic directionDetection() {
    final _$actionInfo = _$_SwipeDetectorActionController.startAction(
        name: '_SwipeDetector.directionDetection');
    try {
      return super.directionDetection();
    } finally {
      _$_SwipeDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onTap() {
    final _$actionInfo = _$_SwipeDetectorActionController.startAction(
        name: '_SwipeDetector.onTap');
    try {
      return super.onTap();
    } finally {
      _$_SwipeDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onHold() {
    final _$actionInfo = _$_SwipeDetectorActionController.startAction(
        name: '_SwipeDetector.onHold');
    try {
      return super.onHold();
    } finally {
      _$_SwipeDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleHasAlreadyMadeGesture() {
    final _$actionInfo = _$_SwipeDetectorActionController.startAction(
        name: '_SwipeDetector.toggleHasAlreadyMadeGesture');
    try {
      return super.toggleHasAlreadyMadeGesture();
    } finally {
      _$_SwipeDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onFinishedGestureCallback() {
    final _$actionInfo = _$_SwipeDetectorActionController.startAction(
        name: '_SwipeDetector.onFinishedGestureCallback');
    try {
      return super.onFinishedGestureCallback();
    } finally {
      _$_SwipeDetectorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mostRecentCoordinates: ${mostRecentCoordinates},
tapCount: ${tapCount},
holdCount: ${holdCount},
dragType: ${dragType},
directionsType: ${directionsType},
resetTheDirectionType: ${resetTheDirectionType},
holdState: ${holdState},
hasAlreadyMadeGesture: ${hasAlreadyMadeGesture}
    ''';
  }
}
