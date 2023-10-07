// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'update_scheduling_time_or_date_getter_store.g.dart';

class UpdateSchedulingTimeOrDateGetterStore = _UpdateSchedulingTimeOrDateGetterStoreBase
    with _$UpdateSchedulingTimeOrDateGetterStore;

abstract class _UpdateSchedulingTimeOrDateGetterStoreBase extends Equatable
    with Store {
  final UpdateSchedulingTimeOrDate logic;

  _UpdateSchedulingTimeOrDateGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, SchedulingSessionUpdateTimeOrDateStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
