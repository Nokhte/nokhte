import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';

class ConstantChannelIdModel {
  static ChannelIdModel get successCase =>
      const ChannelIdModel(channelId: '11111111111111111112222222222222222222');
  static ChannelIdModel get notSuccessCase =>
      const ChannelIdModel(channelId: '');
  static Either<Failure, ChannelIdModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, ChannelIdModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
