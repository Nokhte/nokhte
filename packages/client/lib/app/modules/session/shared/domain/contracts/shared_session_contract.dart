import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session/session.dart';

abstract class SharedSessionContract {
  Future<Either<Failure, SessionPhoneRole>> decidePhonerole(
    NoParams params,
  );
}
