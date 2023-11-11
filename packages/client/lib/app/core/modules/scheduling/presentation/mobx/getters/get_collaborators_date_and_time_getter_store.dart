// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
part 'get_collaborators_date_and_time_getter_store.g.dart';

class GetCollaboratorsDateAndTimeGetterStore = _GetCollaboratorsDateAndTimeGetterStoreBase
    with _$GetCollaboratorsDateAndTimeGetterStore;

abstract class _GetCollaboratorsDateAndTimeGetterStoreBase extends Equatable
    with Store {
  final GetCollaboratorsDateAndTime logic;

  _GetCollaboratorsDateAndTimeGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaboratorsChosenTimeAndDayEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
