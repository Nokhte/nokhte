import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class PresetDiagamConstants {
  static List<LineGradientTypes> alternatingGrads = [
    LineGradientTypes.talking,
    LineGradientTypes.notes,
    LineGradientTypes.talking,
    LineGradientTypes.notes,
  ];

  static List<LineGradientTypes> talkingGrads = [
    LineGradientTypes.talking,
    LineGradientTypes.talking,
    LineGradientTypes.talking,
    LineGradientTypes.talking,
  ];

  static List<List<Alignment>> twoLineAlignment = [
    [
      Alignment.topCenter,
      Alignment.bottomCenter,
    ],
    [
      Alignment.bottomCenter,
      Alignment.topCenter,
    ],
  ];

  static List<List<Alignment>> threeLineAlignment = [
    [
      Alignment.topCenter,
      Alignment.bottomCenter,
    ],
    [
      Alignment.centerRight,
      Alignment.centerLeft,
    ],
    [
      Alignment.bottomCenter,
      Alignment.topCenter,
    ]
  ];

  static List<List<Alignment>> fourLineAlignment = [
    [
      Alignment.topCenter,
      Alignment.bottomCenter,
    ],
    [
      Alignment.centerLeft,
      Alignment.centerRight,
    ],
    [
      Alignment.bottomCenter,
      Alignment.topCenter,
    ],
    [
      Alignment.centerRight,
      Alignment.centerLeft,
    ],
  ];
}
