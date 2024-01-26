import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class ConstantChannelIdEntity {
  static ChannelIdEntity get successCase =>
      const ChannelIdEntity(channelId: "someChannelId");
  static ChannelIdEntity get notSuccessCase =>
      const ChannelIdEntity(channelId: "");
  static Either<Failure, ChannelIdEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, ChannelIdEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
