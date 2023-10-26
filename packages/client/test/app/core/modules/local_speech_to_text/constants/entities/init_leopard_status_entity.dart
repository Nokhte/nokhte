// import 'package:primala/app/core/entities/default_db_status_entity.dart';

// class InitLeopardStatusEntity extends DefaultDBStatusEntity {
//   final bool isInitialized;

//   const InitLeopardStatusEntity({required this.isInitialized})
//       : super(isSent: isInitialized);
// }

import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';

class ConstantInitLeopardStatusEntity {
  static InitLeopardStatusEntity get successCase =>
      const InitLeopardStatusEntity(isInitialized: true);
  static InitLeopardStatusEntity get notSuccessCase =>
      const InitLeopardStatusEntity(isInitialized: false);
  static Either<Failure, InitLeopardStatusEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, InitLeopardStatusEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
