import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/timer_information.dart';

class TimerInformationStreamEntity extends Equatable {
  final Stream<PresenceAndTimeRemaining> theTimeStream;

  const TimerInformationStreamEntity({
    required this.theTimeStream,
  });

  @override
  List<Object> get props => [theTimeStream];
}
