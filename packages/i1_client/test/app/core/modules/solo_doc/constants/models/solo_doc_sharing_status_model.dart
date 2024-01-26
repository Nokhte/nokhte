import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';

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
