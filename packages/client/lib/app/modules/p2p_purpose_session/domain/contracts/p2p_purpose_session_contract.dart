import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

abstract class P2PPurposeSessionContract {
  Future<Either<Failure, AgoraCallTokenEntity>> fetchAgoraToken(
      {required String channelName});
}
