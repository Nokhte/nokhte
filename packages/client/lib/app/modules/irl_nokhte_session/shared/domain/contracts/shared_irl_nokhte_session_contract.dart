import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session.dart';

abstract class SharedIrlNokhteSessionContract {
  Future<Either<Failure, IrlNokhteSessionPhoneRole>> decidePhonerole(
    NoParams params,
  );
}
