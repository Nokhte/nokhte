import 'package:equatable/equatable.dart';

class RoomInformationEntity extends Equatable {
  final String meetingId;
  final String token;
  final String userUID;

  const RoomInformationEntity({
    required this.meetingId,
    required this.token,
    required this.userUID,
  });

  factory RoomInformationEntity.initial() =>
      const RoomInformationEntity(meetingId: '', token: '', userUID: '');

  @override
  List<Object?> get props => [meetingId, token, userUID];
}
