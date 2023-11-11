// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
part 'create_scheduling_session_getter_store.g.dart';

class CreateSchedulingSessionGetterStore = _CreateSchedulingSessionGetterStoreBase
    with _$CreateSchedulingSessionGetterStore;

abstract class _CreateSchedulingSessionGetterStoreBase extends Equatable
    with Store {
  final CreateSchedulingSession logic;

  _CreateSchedulingSessionGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, SchedulingSessionCreationStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
