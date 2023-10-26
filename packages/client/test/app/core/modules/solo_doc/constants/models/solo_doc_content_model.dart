import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/data/data.dart';

class ConstantSoloDocContentModel {
  static SoloDocContentModel get successCase =>
      const SoloDocContentModel(content: "content");
  static SoloDocContentModel get notSuccessCase =>
      const SoloDocContentModel(content: "");
  static Either<Failure, SoloDocContentModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SoloDocContentModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
