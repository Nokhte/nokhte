import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

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
