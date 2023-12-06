// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';

class RotatingTextData extends Equatable {
  String mainMessage;
  String subMessage;
  double mainMessageFontSize;
  double subMessageFontSize;
  bool pauseHere;
  Gestures unlockGesture;
  Duration extraDelayTime;

  RotatingTextData({
    required this.mainMessage,
    required this.subMessage,
    required this.mainMessageFontSize,
    required this.subMessageFontSize,
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
