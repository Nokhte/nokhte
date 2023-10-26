// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'get_direction_angle_getter_store.g.dart';

class GetDirectionAngleGetterStore = _GetDirectionAngleGetterStoreBase
    with _$GetDirectionAngleGetterStore;

abstract class _GetDirectionAngleGetterStoreBase extends Equatable with Store {
  final GetDirectionAngle logic;

  _GetDirectionAngleGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, DirectionAngleEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
