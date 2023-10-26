// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'set_reference_angle_getter_store.g.dart';

class SetReferenceAngleGetterStore = _SetReferenceAngleGetterStoreBase
    with _$SetReferenceAngleGetterStore;

abstract class _SetReferenceAngleGetterStoreBase extends Equatable with Store {
  final SetReferenceAngle logic;

  _SetReferenceAngleGetterStoreBase({
    required this.logic,
  });

  ReferenceAngleSetterStatusEntity call(params) => logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
