// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
part 'update_the_staging_area_getter_store.g.dart';

class UpdateTheStagingAreaGetterStore = _UpdateTheStagingAreaGetterStoreBase
    with _$UpdateTheStagingAreaGetterStore;

abstract class _UpdateTheStagingAreaGetterStoreBase extends Equatable
    with Store {
  final UpdateTheStagingArea logic;

  _UpdateTheStagingAreaGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, StagingAreaUpdateStatusEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
