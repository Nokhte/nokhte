// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
part 'get_timer_information_stream_getter_store.g.dart';

class GetTimerInformationStreamGetterStore = _GetTimerInformationStreamGetterStoreBase
    with _$GetTimerInformationStreamGetterStore;

abstract class _GetTimerInformationStreamGetterStoreBase extends Equatable
    with Store {
  final GetTimerInformationStream logic;

  _GetTimerInformationStreamGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, TimerInformationStreamEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
