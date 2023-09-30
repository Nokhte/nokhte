import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class SvgAnimtionCostants {
  //Scaling Value
  static double get scalingRatio => 1.0;
  static Matrix4 get scalingMatrix =>
      Matrix4.identity()..scale(scalingRatio, scalingRatio);
  // Cross Values
  // static String get crossSvgPath =>
  //     'M11.5 23C17.8513 23 23 17.8513 23 11.5V11.5C23 5.14873 28.1487 0 34.5 0H35H35.5C41.8513 0 47 5.14873 47 11.5V11.5C47 17.8513 52.1487 23 58.5 23V23C64.8513 23 70 28.1487 70 34.5V35V35.5C70 41.8513 64.8513 47 58.5 47V47C52.1487 47 47 52.1487 47 58.5V58.5C47 64.8513 41.8513 70 35.5 70H35H34.5C28.1487 70 23 64.8513 23 58.5V58.5C23 52.1487 17.8513 47 11.5 47H10.5V47C4.70101 47 0 42.299 0 36.5V35V34.5C0 28.1487 5.14873 23 11.5 23V23Z';
  static String get pillSvgPath =>
      "M0 17.1377V13.7872C0 6.17275 6.17276 0 13.7872 0V0V0C21.0844 0 27 5.91555 27 13.2128V17.1377V22.6875V27.1562V31.2812V35.8696V41.7872C27 49.0844 21.0844 55 13.7872 55V55V55C6.17276 55 0 48.8272 0 41.2128V35.8696V31.2812V26.4688V22.6875V17.1377Z";
  static Path get pillPath => parseSvgPathData(
        pillSvgPath,
      ).transform(
        scalingMatrix.storage,
      );
  // Circle Values
  static String get circleSvgPath =>
      'M35 0h0s35 0 35 35v0s0 35 -35 35h0s-35 0 -35 -35v0s0 -35 35 -35';
  static Path get circlePath => parseSvgPathData(
        circleSvgPath,
      ).transform(
        scalingMatrix.storage,
      );
}
