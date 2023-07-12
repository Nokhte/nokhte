import 'package:equatable/equatable.dart';

class RespondToSchedulingRequestParamEntity extends Equatable {
  final String responseTimestampz;
  final String originalSenderUID;

  const RespondToSchedulingRequestParamEntity(
      {required this.responseTimestampz, required this.originalSenderUID});

  @override
  List<Object> get props => [
        responseTimestampz,
        originalSenderUID,
      ];
}
