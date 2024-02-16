import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

class BaseGetUserInfo<T>
    implements AbstractFutureLogic<UserJourneyInfoEntity, NoParams> {
  final T contract;

  BaseGetUserInfo({required this.contract});

  @override
  call(NoParams params) async {
    return Right(UserJourneyInfoEntity.initial());
  }
}
