import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GestureCrossConfiguration extends Equatable {
  final GestureCrossNokhteTypes top;
  final GestureCrossNokhteTypes bottom;
  final GestureCrossNokhteTypes left;
  final GestureCrossNokhteTypes right;

  const GestureCrossConfiguration({
    this.top = GestureCrossNokhteTypes.stroke,
    this.bottom = GestureCrossNokhteTypes.stroke,
    this.left = GestureCrossNokhteTypes.stroke,
    this.right = GestureCrossNokhteTypes.stroke,
  });

  List<Offset> _getOffsetsForType(
      GestureCrossNokhteTypes type, Offset defaultOffset) {
    final List<Offset> offsets = [];

    if (top == type) offsets.add(CircleOffsets.top);
    if (bottom == type) offsets.add(CircleOffsets.bottom);
    if (left == type) offsets.add(CircleOffsets.left);
    if (right == type) offsets.add(CircleOffsets.right);

    return offsets.isEmpty ? [defaultOffset] : offsets;
  }

  List<Offset> getGradientOffsets() =>
      _getOffsetsForType(GestureCrossNokhteTypes.gradient, CircleOffsets.top);

  List<Offset> getStrokeOffsets() =>
      _getOffsetsForType(GestureCrossNokhteTypes.stroke, CircleOffsets.top);

  @override
  List<Object> get props => [];
}
