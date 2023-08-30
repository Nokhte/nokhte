import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

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
