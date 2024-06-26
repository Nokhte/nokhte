// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
part 'gesture_direction_detector.g.dart';

class GestureDirectionDetector = _GestureDirectionDetector
    with _$GestureDirectionDetector;

abstract class _GestureDirectionDetector extends Equatable with Store {
  @observable
  ObservableList<Offset> mostRecentCoordinates = ObservableList.of([]);

  @observable
  DragType dragType = DragType.initial;

  @observable
  GestureDirections directionsType = GestureDirections.initial;

  @action
  setDragType(DragType newDragType) => dragType = newDragType;

  @action
  onUpdateCallback(
    Offset mostRecentOffset,
    DragType newDragType,
  ) {
    mostRecentCoordinates.add(mostRecentOffset);
    dragType = newDragType;
  }

  @action
  resetDirectionsType() => directionsType = GestureDirections.initial;

  @action
  onFinishedGestureCallback() {
    if (dragType == DragType.horizontal) {
      final firstVal = mostRecentCoordinates.first.dx;
      final lastVal = mostRecentCoordinates.last.dx;
      directionsType =
          firstVal < lastVal ? GestureDirections.left : GestureDirections.right;
    } else if (dragType == DragType.vertical) {
      final firstVal = mostRecentCoordinates.first.dy;
      final lastVal = mostRecentCoordinates.last.dy;
      if ((firstVal - lastVal).abs() < 50) return;
      directionsType =
          firstVal < lastVal ? GestureDirections.down : GestureDirections.up;
    }
    mostRecentCoordinates.clear();
  }

  @override
  List<Object> get props => [];
}
