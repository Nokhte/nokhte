import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class SvgAnimtionConstants {
  static double get scalingRatio => 1.0;
  static Matrix4 get scalingMatrix =>
      Matrix4.identity()..scale(scalingRatio, scalingRatio);
  static String get crossSvgPath =>
      'M11.5 23C17.8513 23 23 17.8513 23 11.5V11.5C23 5.14873 28.1487 0 34.5 0H35H35.5C41.8513 0 47 5.14873 47 11.5V11.5C47 17.8513 52.1487 23 58.5 23V23C64.8513 23 70 28.1487 70 34.5V35V35.5C70 41.8513 64.8513 47 58.5 47V47C52.1487 47 47 52.1487 47 58.5V58.5C47 64.8513 41.8513 70 35.5 70H35H34.5C28.1487 70 23 64.8513 23 58.5V58.5C23 52.1487 17.8513 47 11.5 47H10.5V47C4.70101 47 0 42.299 0 36.5V35V34.5C0 28.1487 5.14873 23 11.5 23V23Z';
  static String get pillSvgPath =>
      "M0 17.1377V13.7872C0 6.17275 6.17276 0 13.7872 0V0V0C21.0844 0 27 5.91555 27 13.2128V17.1377V22.6875V27.1562V31.2812V35.8696V41.7872C27 49.0844 21.0844 55 13.7872 55V55V55C6.17276 55 0 48.8272 0 41.2128V35.8696V31.2812V26.4688V22.6875V17.1377Z";
  static String get schedulingDeltaSvg =>
      "M15.4769 25.0114C17.5037 20.0041 19.435 14.96 21.4207 9.93619C23.2912 5.20389 25.472 0 26.0173 0C26.478 0 28.1059 3.71387 29.7278 7.71983C32.3517 14.2005 34.8291 20.741 37.4524 27.2219C40.4954 34.7401 43.6883 42.1962 46.8851 49.6503C49.3467 55.3902 51.7695 61.2478 51.5173 61.5C51.0176 61.9997 27.0173 41 26.0173 41C25.0173 41 0.517017 62 0.0172886 61.5C-0.204335 61.2783 1.73743 56.7295 3.9673 51.7353C7.92176 42.8786 11.8378 34.0023 15.4769 25.0114Z";

  static Path get schedulingDeltaPath => parseSvgPathData(
        schedulingDeltaSvg,
      ).transform(scalingMatrix.storage);

  static Path get pillPath => parseSvgPathData(
        pillSvgPath,
      ).transform(
        scalingMatrix.storage,
      );
  static String get circleSvgPath =>
      'M40, 35 m -35, 0 a 35,35 0 1,0 70,0 a 35,35 0 1,0 -70,0';
  static Path get circlePath => parseSvgPathData(
        circleSvgPath,
      ).transform(
        scalingMatrix.storage,
      );
  static String get threeCirclePlatform =>
      "M24.9275 27.2463H13.913C6.22907 27.2463 0 21.0173 0 13.3333C0 5.9695 5.96953 -3.8147e-05 13.3333 -3.8147e-05H24.9275H33L39.5 -3.8147e-05H45.5H52.1739L66.6667 -3.8147e-05C74.0305 -3.8147e-05 80 5.9695 80 13.3333C80 21.0173 73.7709 27.2463 66.087 27.2463L52.1739 27.2463H45.5H38.5L33 27.2463H24.9275Z";
  static Path get threeCirclePlatformPath =>
      parseSvgPathData(threeCirclePlatform);

  static String get fiveCirclePlatform =>
      'M37.3913 27.2464L13.913 27.2464C6.22908 27.2464 0 21.0173 0 13.3334C0 5.96956 5.96954 2.28882e-05 13.3333 2.28882e-05L37.3913 2.28882e-05H49.5H59.25L68.25 2.28882e-05H78.2609L106.667 2.28882e-05C114.03 2.28882e-05 120 5.96956 120 13.3334C120 21.0173 113.771 27.2464 106.087 27.2464L78.2609 27.2464H68.25L57.75 27.2464H49.5H37.3913Z';
  static Path get fiveCirclePlatformPath =>
      parseSvgPathData(fiveCirclePlatform).transform(
        scalingMatrix.storage,
      );
}
