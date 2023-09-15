import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';

class ConstantInitLeopardStatusModel {
  static InitLeopardStatusModel get successCase =>
      const InitLeopardStatusModel(isInitialized: true);
  static InitLeopardStatusModel get notSuccessCase =>
      const InitLeopardStatusModel(isInitialized: false);
  static Either<Failure, InitLeopardStatusModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, InitLeopardStatusModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
