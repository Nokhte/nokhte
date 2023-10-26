import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';

abstract class AbstractFutureLogic<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class AbstractSyncLogic<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class AbstractSyncNoFailureLogic<Type, Params> {
  Type call(Params params);
}

abstract class AbstractStreamLogic<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}

abstract class AbstractNoFailureStreamLogic<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
