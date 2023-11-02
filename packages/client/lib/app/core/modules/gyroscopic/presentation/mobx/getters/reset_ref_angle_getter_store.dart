// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'reset_ref_angle_getter_store.g.dart';

class ResetRefAngleGetterStore = _ResetRefAngleGetterStoreBase
    with _$ResetRefAngleGetterStore;

abstract class _ResetRefAngleGetterStoreBase extends Equatable with Store {
  final ResetRefAngle logic;

  _ResetRefAngleGetterStoreBase({
    required this.logic,
  });

  ReferenceAngleSetterStatusEntity call(params) => logic(params);

  @override
  List<Object> get props => [];
}
