import 'package:equatable/equatable.dart';

class AgoraCallTokenEntity extends Equatable {
  final String returnedToken;

  const AgoraCallTokenEntity({
    required this.returnedToken,
  });

  @override
  List<Object> get props => [
        returnedToken,
      ];
}
