import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

abstract class SoloDocContract {
  Future<Either<Failure, String>> getSoloDocContent(GetSoloDocParams params);
  Future<Either<Failure, bool>> submitDocContent(SubmitSoloDocParams params);
  Future<Either<Failure, bool>> createSoloDoc(CreateSoloDocParams params);
  Future<Either<Failure, bool>> sealSoloDoc();
  Future<Either<Failure, bool>> shareSoloDoc();
}
