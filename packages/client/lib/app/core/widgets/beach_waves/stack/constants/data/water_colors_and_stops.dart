import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/types/types.dart';

class WaterColorsAndStops {
  // static List<Color> get oldOnShoreWaterGradient => const [
  //       Color(0xFF0B2431),
  //       Color(0xFF15484E),
  //       Color(0xFF176257),
  //       Color(0xFF1F8A7D),
  //       Color(0xFF29A48D),
  //     ];
  // static List<Color> get oldoceanDiveWaterGradient => const [
  //       Color(0xFF29A48D),
  //       Color(0xFF1F8A7D),
  //       Color(0xFF176257),
  //       Color(0xFF15484E),
  //       Color(0xFF0B2431),
  //     ];
  // static List<Color> get toTheDepthsWaterGradient => const [
  //       Color(0xFF66CF90),
  //       Color(0xFF88C9B9),
  //       Color(0xFF51A18D),
  //       Color(0xFF274D4F),
  //       Color(0xFF122430),
  //     ];
  // ================================
  static List<ColorAndStop> get onShoreWater => const [
        ColorAndStop(Color(0xFF51A18D), 0),
        ColorAndStop(Color(0xFF499384), .1563),
        ColorAndStop(Color(0xFF3E8077), .3111),
        ColorAndStop(Color(0xFF326562), .4583),
        ColorAndStop(Color(0xFF274D4F), .5885),
        ColorAndStop(Color(0xFF214147), .7240),
        ColorAndStop(Color(0xFF1D3741), .8438),
        ColorAndStop(Color(0xFF122430), 1.00),
      ];

  static List<ColorAndStop> get oceanDiveWater => const [
        ColorAndStop(Color(0xFF122430), 0),
        ColorAndStop(Color(0xFF1D3741), .1563),
        ColorAndStop(Color(0xFF214147), .3111),
        ColorAndStop(Color(0xFF274D4F), .4583),
        ColorAndStop(Color(0xFF326562), .5885),
        ColorAndStop(Color(0xFF3E8077), .7240),
        ColorAndStop(Color(0xFF499384), .8438),
        ColorAndStop(Color(0xFF51A18D), 1.00),
      ];
  static List<ColorAndStop> get toTheDepthsWater => const [
        ColorAndStop(Color(0xFF66CF90), 0),
        ColorAndStop(Color(0xFF66CF90), .1302),
        ColorAndStop(Color(0xFF88C9B9), .2548),
        ColorAndStop(Color(0xFF51A18D), .4357),
        ColorAndStop(Color(0xFF3E8077), .5826),
        ColorAndStop(Color(0xFF274D4F), .7261),
        ColorAndStop(Color(0xFF1D3741), .8620),
        ColorAndStop(Color(0xFF122430), 1.00),
      ];
}
