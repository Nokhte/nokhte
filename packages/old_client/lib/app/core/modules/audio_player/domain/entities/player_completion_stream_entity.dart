import 'package:equatable/equatable.dart';

class PlayerCompletionStreamEntity extends Equatable {
  final Stream<void> stream;

  const PlayerCompletionStreamEntity({
    required this.stream,
  });

  @override
  List<Object> get props => [stream];
}
