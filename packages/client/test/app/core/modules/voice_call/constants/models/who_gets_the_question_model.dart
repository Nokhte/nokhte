import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/data/data.dart';

class ConstantWhoGetsTheQuestionModel {
  static WhoGetsTheQuestionModel get hasItCase =>
      const WhoGetsTheQuestionModel(hasIt: true);
  static WhoGetsTheQuestionModel get doesNotHaveItCase =>
      const WhoGetsTheQuestionModel(hasIt: false);
  static Either<Failure, WhoGetsTheQuestionModel> get wrappedHasItCase =>
      Right(hasItCase);
  static Either<Failure, WhoGetsTheQuestionModel>
      get wrappedDoesNotHaveItCase => Right(doesNotHaveItCase);
}
