import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class ConstantWhoGetsTheQuestionEntity {
  static WhoGetsTheQuestionEntity get hasItCase =>
      const WhoGetsTheQuestionEntity(hasIt: true);
  static WhoGetsTheQuestionEntity get doesNotHaveItCase =>
      const WhoGetsTheQuestionEntity(hasIt: false);
  static Either<Failure, WhoGetsTheQuestionEntity> get wrappedHasItCase =>
      Right(hasItCase);
  static Either<Failure, WhoGetsTheQuestionEntity>
      get wrappedDoesNotHaveItCase => Right(doesNotHaveItCase);
}
