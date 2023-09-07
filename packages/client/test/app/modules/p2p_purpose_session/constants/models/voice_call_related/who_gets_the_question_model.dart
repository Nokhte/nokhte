import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/models/models.dart';

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
