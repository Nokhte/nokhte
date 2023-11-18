// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
part 'delete_the_timer_getter_store.g.dart';

class DeleteTheTimerGetterStore = _DeleteTheTimerGetterStoreBase
    with _$DeleteTheTimerGetterStore;

abstract class _DeleteTheTimerGetterStoreBase extends Equatable with Store {
  final DeleteTheTimer logic;

  _DeleteTheTimerGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, TimerDeletionStatusEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
