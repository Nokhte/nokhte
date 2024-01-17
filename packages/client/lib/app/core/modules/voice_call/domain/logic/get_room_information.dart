import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class GetRoomInformation
    implements AbstractFutureLogic<RoomInformationEntity, NoParams> {
  final VoiceCallContract contract;

  GetRoomInformation({required this.contract});

  @override
  call(params) async => await contract.getRoomInformation(params);
}
