import 'package:equatable/equatable.dart';

class FadeInMessageData extends Equatable {
  final double fontSize;
  final String message;

  const FadeInMessageData({
    required this.fontSize,
    required this.message,
  });

  @override
  List<Object> get props => [fontSize, message];
}
