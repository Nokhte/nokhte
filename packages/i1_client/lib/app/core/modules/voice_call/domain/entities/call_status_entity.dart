import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';

class CallStatusEntity extends Equatable {
  final CallStatus callStatus;

  const CallStatusEntity({
    required this.callStatus,
  });

  @override
  List<Object> get props => [callStatus];
}
