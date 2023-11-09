// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
// * Mobx Codegen Inclusion
part 'swipe_detector.g.dart';

class SwipeDetector = _SwipeDetector with _$SwipeDetector;

abstract class _SwipeDetector extends Equatable with Store {
  @observable
  ObservableList<Offset> mostRecentCoordinates = ObservableList.of([]);

  @observable
  DragType dragType = DragType.initial;

  @observable
  GestureDirections directionsType = GestureDirections.initial;

  @action
  setDirectionsType(GestureDirections newDirectionsType) =>
      directionsType = newDirectionsType;

  @observable
  HoldState holdState = HoldState.initial;

  @action
  setDragType(DragType newDragType) => dragType = newDragType;

  @action
  onUpdateCallback(
    Offset mostRecentOffset,
    DragType newDragType,
  ) {
    mostRecentCoordinates.add(mostRecentOffset);
    if (dragType != newDragType) {
      dragType = newDragType;
    }
    directionDetection();
  }

  @action
  directionDetection() {
    // print("dragType $dragType");
    holdState = HoldState.holding;
    if (dragType == DragType.horizontal) {
      final firstVal = mostRecentCoordinates.first.dx;
      final lastVal = mostRecentCoordinates.last.dx;
      print(
          "horiz ${firstVal < lastVal ? GestureDirections.left : GestureDirections.right}");
      final directionsComparison =
          firstVal < lastVal ? GestureDirections.left : GestureDirections.right;
      if (directionsComparison != directionsType) {
        setDirectionsType(directionsComparison);
      }
    } else if (dragType == DragType.vertical) {
      final firstVal = mostRecentCoordinates.first.dy;
      final lastVal = mostRecentCoordinates.last.dy;
      print(
          "vert ${firstVal < lastVal ? GestureDirections.down : GestureDirections.up}");
      final directionsComparison =
          firstVal < lastVal ? GestureDirections.down : GestureDirections.up;
      if (directionsComparison != directionsType) {
        setDirectionsType(directionsComparison);
      }
    }
  }

  @observable
  bool hasAlreadyMadeGesture = false;

  @action
  toggleHasAlreadyMadeGesture() =>
      hasAlreadyMadeGesture = !hasAlreadyMadeGesture;

  @action
  onFinishedGestureCallback() {
    // toggleHasAlreadyMadeGesture();
    dragType = DragType.initial;
    holdState = HoldState.initial;
    mostRecentCoordinates.clear();
  }

  @override
  List<Object> get props => [];
}
