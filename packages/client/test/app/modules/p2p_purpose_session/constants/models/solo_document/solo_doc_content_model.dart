import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/models/solo_document/solo_doc_content_model.dart';

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
