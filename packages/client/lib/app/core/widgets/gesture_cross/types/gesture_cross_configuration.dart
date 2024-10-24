import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GestureCrossConfiguration {
  final Either<StrokeConfig, EmptySpace> top;
  final Either<StrokeConfig, EmptySpace> bottom;
  final Either<StrokeConfig, EmptySpace> left;
  final Either<StrokeConfig, EmptySpace> right;

  List get directions => [top, bottom, left, right];

  GestureCrossConfiguration({
    this.top = const Left(StrokeConfig()),
    this.bottom = const Left(StrokeConfig()),
    this.left = const Left(StrokeConfig()),
    this.right = const Left(StrokeConfig()),
  });

  List<Offset> _getOffsetsForType(GestureCrossNokhteTypes type) {
    final List<Offset> offsets = [];
    for (int i = 0; i < directions.length; i++) {
      directions[i].fold((stroke) {
        if (type == GestureCrossNokhteTypes.stroke) {
          offsets.add(CircleOffsets.directions[i]);
        }
      }, (gradient) {
        if (type == GestureCrossNokhteTypes.gradient) {
          offsets.add(CircleOffsets.directions[i]);
        }
      });
    }
    return offsets;
  }

  List<GradientNokhteInformation> getGradientInformation() {
    final List<GradientNokhteInformation> temp = [];
    for (int i = 0; i < directions.length; i++) {
      directions[i].fold((stroke) {}, (NokhteGradientConfig gradient) {
        temp.add(GradientNokhteInformation(
          colors: gradient.colors,
          offsets: CircleOffsets.directions[i],
          stops: gradient.stops,
        ));
      });
    }
    return temp;
  }

  List<Offset> getStrokeOffsets() =>
      _getOffsetsForType(GestureCrossNokhteTypes.stroke);
}

class EmptySpace {}
