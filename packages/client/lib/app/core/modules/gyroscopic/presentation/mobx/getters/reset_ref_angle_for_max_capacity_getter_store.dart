// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'reset_ref_angle_for_max_capacity_getter_store.g.dart';

class ResetRefAngleForMaxCapacityGetterStore = _ResetRefAngleForMaxCapacityGetterStoreBase
    with _$ResetRefAngleForMaxCapacityGetterStore;

abstract class _ResetRefAngleForMaxCapacityGetterStoreBase extends Equatable
    with Store {
  final ResetRefAngleForMaxCapacity logic;

  _ResetRefAngleForMaxCapacityGetterStoreBase({
    required this.logic,
  });

  ReferenceAngleSetterStatusEntity call(params) => logic(params);

  @override
  List<Object> get props => [];
}
