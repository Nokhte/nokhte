// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
part 'update_timer_running_status_getter_store.g.dart';

class UpdateTimerRunningStatusGetterStore = _UpdateTimerRunningStatusGetterStoreBase
    with _$UpdateTimerRunningStatusGetterStore;

abstract class _UpdateTimerRunningStatusGetterStoreBase extends Equatable
    with Store {
  final UpdateTimerRunningStatus logic;

  _UpdateTimerRunningStatusGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, TimerRunningUpdateStatusEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
