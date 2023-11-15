// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
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
