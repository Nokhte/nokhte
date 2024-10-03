import 'package:flutter/material.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class AuxiliaryNokhteUtils {
  static StartAndEndOffsets getOffsets(
    Size screenSize, {
    required AuxiliaryNokhtePositions position,
    required NokhteScaleState direction,
  }) {
    Offset start = Offset.zero;
    Offset end = Offset.zero;
    final screenCenter = Offset(
      screenSize.width / 2,
      screenSize.height / 2,
    );
    switch (position) {
      case AuxiliaryNokhtePositions.left:
        switch (direction) {
          case NokhteScaleState.enlarge:
            start = Offset(CircleOffsets.left.dx, CircleOffsets.left.dy);
            end = Offset(
              -useScaledSize(
                baseValue: .13,
                screenSize: screenSize,
                bumpPerHundredth: .0001,
              ),
              (-screenCenter.dy) * .8,
            );
          case NokhteScaleState.shrink:
            start = Offset(
              -useScaledSize(
                baseValue: .13,
                screenSize: screenSize,
                bumpPerHundredth: .0001,
              ),
              (-screenCenter.dy) * .8,
            );
            end = Offset(CircleOffsets.left.dx, CircleOffsets.left.dy);
        }
      case AuxiliaryNokhtePositions.right:
        switch (direction) {
          case NokhteScaleState.enlarge:
            start = Offset(CircleOffsets.right.dx, CircleOffsets.right.dy);
            end = Offset(
              useScaledSize(
                baseValue: .21,
                screenSize: screenSize,
                bumpPerHundredth: .0007,
              ),
              (-screenCenter.dy) * .8,
            );
          case NokhteScaleState.shrink:
            start = Offset(
              useScaledSize(
                baseValue: .21,
                screenSize: screenSize,
                bumpPerHundredth: .0007,
              ),
              (-screenCenter.dy) * .8,
            );
            end = Offset(CircleOffsets.right.dx, CircleOffsets.right.dy);
        }
      case AuxiliaryNokhtePositions.top:
        switch (direction) {
          case NokhteScaleState.enlarge:
            start = Offset(CircleOffsets.center.dx, CircleOffsets.top.dy);
            end = Offset(
              CircleOffsets.center.dx,
              // (-screenCenter.dy) * 1.2,
              -useScaledSize(
                baseValue: .6,
                screenSize: screenSize,
                bumpPerHundredth: .0003,
              ),
            );
          case NokhteScaleState.shrink:
            start = Offset(
              CircleOffsets.center.dx,
              // (-screenCenter.dy) * 1.2,
              -useScaledSize(
                baseValue: .6,
                screenSize: screenSize,
                bumpPerHundredth: .0003,
              ),
            );
            end = Offset(CircleOffsets.center.dx, CircleOffsets.top.dy);
        }
      case AuxiliaryNokhtePositions.bottom:
        switch (direction) {
          case NokhteScaleState.enlarge:
            start = Offset(CircleOffsets.center.dx, CircleOffsets.bottom.dy);
            end = Offset(
              CircleOffsets.center.dx,
              -useScaledSize(
                baseValue: .21,
                screenSize: screenSize,
                bumpPerHundredth: -.0005,
              ),
              // (-screenCenter.dy) * .4,
            );
          case NokhteScaleState.shrink:
            start = Offset(
              CircleOffsets.center.dx,
              -useScaledSize(
                baseValue: .21,
                screenSize: screenSize,
                bumpPerHundredth: -.0005,
              ),
              // (-screenCenter.dy) * .4,
            );
            end = Offset(CircleOffsets.center.dx, CircleOffsets.bottom.dy);
        }
      default:
        break;
    }
    return StartAndEndOffsets(
      start: start,
      end: end,
    );
  }

  static List<ColorAndStop> getGradient(AuxiliaryNokhteColorways colorway) {
    List<ColorAndStop> temp = [];
    if (colorway == AuxiliaryNokhteColorways.invertedBeachWave) {
      temp = const [
        ColorAndStop(Color(0xFFFFE6C4), 0.0),
        ColorAndStop(Color(0xFFFFBC78), .33),
        ColorAndStop(Color(0xFF42FFD9), .4),
        ColorAndStop(Color(0xFF4497C5), 1.0),
      ];
    } else if (colorway == AuxiliaryNokhteColorways.beachWave) {
      temp = const [
        ColorAndStop(Color(0xFF407F74), 0),
        ColorAndStop(Color(0xFF53A28F), .4),
        ColorAndStop(Color(0xFF866243), .4),
        ColorAndStop(Color(0xFFCBB28E), 1),
      ];
    } else if (colorway == AuxiliaryNokhteColorways.vibrantBlue ||
        colorway == AuxiliaryNokhteColorways.exitVibrantBlue ||
        colorway == AuxiliaryNokhteColorways.informationTint) {
      temp = const [
        ColorAndStop(Color(0xFF44D3FE), 0),
        ColorAndStop(Color(0xFF44D3FE), 0),
        ColorAndStop(Color(0xFF6BE9BB), 1),
        ColorAndStop(Color(0xFF6BE9BB), 1),
      ];
    } else if (colorway == AuxiliaryNokhteColorways.deeperBlue) {
      temp = const [
        ColorAndStop(Color(0xFF40F3F3), 0),
        ColorAndStop(Color(0xFF40F3F3), 0),
        ColorAndStop(Color(0xFF4072F3), 1),
        ColorAndStop(Color(0xFF4072F3), 1),
      ];
    } else if (colorway == AuxiliaryNokhteColorways.orangeSand ||
        colorway == AuxiliaryNokhteColorways.exitOrangeSand) {
      temp = const [
        ColorAndStop(Color(0xFFFFE6C4), 0),
        ColorAndStop(Color(0xFFFFE6C4), 0),
        ColorAndStop(Color(0xFFFFBC78), .49),
        ColorAndStop(Color(0xFFFFBC78), .49),
      ];
    } else if (colorway == AuxiliaryNokhteColorways.deeperBlue) {
      temp = const [
        ColorAndStop(Color(0xFF4072F3), 0),
        ColorAndStop(Color(0xFF4072F3), 0),
        ColorAndStop(Color(0xFF40F3F3), 1.00),
        ColorAndStop(Color(0xFF40F3F3), 1.00),
        //
      ];
    }
    return temp;
  }
}
