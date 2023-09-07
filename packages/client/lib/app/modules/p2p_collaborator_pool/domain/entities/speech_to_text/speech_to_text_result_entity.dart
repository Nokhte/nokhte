import 'package:equatable/equatable.dart';

class SpeechToTextResultEntity extends Equatable {
  final String speechResult;

  const SpeechToTextResultEntity({
    required this.speechResult,
  });

  @override
  List<Object> get props => [speechResult];
}
