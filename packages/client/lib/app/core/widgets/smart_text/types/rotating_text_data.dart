import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RotatingTextData extends Equatable {
  String text;
  String subText;
  double mainFontSize;
  double subFontSize;
  bool pauseHere;
  Duration onScreenTime;
  Duration initialFadeInDelay;

  RotatingTextData({
    this.initialFadeInDelay = Duration.zero,
    required this.text,
    this.subText = '',
    this.mainFontSize = 25.0,
    this.subFontSize = 15.0,
    this.pauseHere = false,
    this.onScreenTime = Duration.zero,
  });

  @override
  List<Object> get props => [
        text,
        subText,
        mainFontSize,
        subFontSize,
        pauseHere,
        onScreenTime,
        initialFadeInDelay,
      ];
}
