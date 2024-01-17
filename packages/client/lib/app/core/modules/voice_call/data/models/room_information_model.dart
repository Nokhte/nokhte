import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class RoomInformationModel extends RoomInformationEntity {
  const RoomInformationModel({
    required super.meetingId,
    required super.token,
    required super.userUID,
  });
}
