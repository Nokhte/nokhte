import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';

class ConstantChannelIdModel {
  static ChannelIdModel get successCase =>
      const ChannelIdModel(channelId: '11111111111111111111111111111111111111');
  static ChannelIdModel get notSuccessCase =>
      const ChannelIdModel(channelId: '');
  static Either<Failure, ChannelIdModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, ChannelIdModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
