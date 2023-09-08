import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/data.dart';

class ConstantSoloDocSharingStatusModel {
  static SoloDocSharingStatusModel get successCase =>
      const SoloDocSharingStatusModel(isShared: true);
  static SoloDocSharingStatusModel get notSuccessCase =>
      const SoloDocSharingStatusModel(isShared: false);
  static Either<Failure, SoloDocSharingStatusModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocSharingStatusModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
