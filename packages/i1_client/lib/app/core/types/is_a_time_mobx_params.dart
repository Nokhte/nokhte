import 'package:equatable/equatable.dart';

class IsATimeMobxParams extends Equatable {
  final int hour;
  final bool isAStartingValue;

  const IsATimeMobxParams({
    required this.hour,
    required this.isAStartingValue,
  });

  @override
  List<Object> get props => [hour, isAStartingValue];
}
