import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';

// ignore: must_be_immutable
class RotatingTextData extends Equatable {
  String mainMessage;
  String subMessage;
  double mainMessageFontSize;
  double subMessageFontSize;
  bool pauseHere;
  Gestures unlockGesture;
  Duration onScreenTime;
  Duration initialFadeInDelay;

  RotatingTextData({
    this.initialFadeInDelay = Duration.zero,
    required this.mainMessage,
    this.subMessage = '',
    this.mainMessageFontSize = 25.0,
    this.subMessageFontSize = 15.0,
    this.pauseHere = false,
    this.unlockGesture = Gestures.none,
    this.onScreenTime = Duration.zero,
  });

  @override
  List<Object> get props => [
        mainMessage,
        subMessage,
        pauseHere,
        unlockGesture,
        onScreenTime,
      ];
}
