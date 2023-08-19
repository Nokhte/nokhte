// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';

class RotatingTextData extends Equatable {
  String mainMessage;
  String subMessage;
  bool pauseHere;
  Gestures unlockGesture;
  Duration extraDelayTime;

  RotatingTextData({
    required this.mainMessage,
    required this.subMessage,
    required this.pauseHere,
    required this.unlockGesture,
    required this.extraDelayTime,
  });

  @override
  List<Object> get props => [
        mainMessage,
        subMessage,
        pauseHere,
        unlockGesture,
        extraDelayTime,
      ];
}
