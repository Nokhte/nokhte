import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

abstract class VoiceCallContract {
  Future<Either<Failure, RoomInformationEntity>> getRoomInformation(
      NoParams params);
}
