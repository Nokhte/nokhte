import 'package:equatable/equatable.dart';

class AudioProcessingEntity extends Equatable {
  final String resultingWords;

  const AudioProcessingEntity({required this.resultingWords});

  @override
  List<Object> get props => [resultingWords];
}
