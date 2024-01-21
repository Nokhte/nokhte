import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_docs/domain/domain.dart';

abstract class SoloDocsContract {
  Future<Either<Failure, String>> getSoloDocContent(GetSoloDocParams params);
  Future<Either<Failure, bool>> submitDocContent(String params);
  Future<Either<Failure, bool>> createSoloDoc(SoloDocTypes params);
  Future<Either<Failure, bool>> sealSoloDoc();
  Future<Either<Failure, bool>> shareSoloDoc();
}
