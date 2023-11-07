// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
// * Mobx Codegen Inclusion
part 'base_direction_decider_store.g.dart';

class BaseDirectionDeciderStore = _BaseDirectionDeciderStoreBase
    with _$BaseDirectionDeciderStore;

abstract class _BaseDirectionDeciderStoreBase extends Equatable with Store {
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
      if ((firstVal - lastVal).abs() < 50) return;
      directionsType =
          firstVal < lastVal ? GestureDirections.right : GestureDirections.left;
    } else if (dragType == DragType.vertical) {
      final firstVal = mostRecentCoordinates.first.dy;
      final lastVal = mostRecentCoordinates.last.dy;
      if ((firstVal - lastVal).abs() < 50) return;
      // print("fv $firstVal lv $lastVal");
      directionsType =
          firstVal < lastVal ? GestureDirections.down : GestureDirections.up;
    }
    mostRecentCoordinates.clear();
  }

  @override
  List<Object> get props => [];
}
