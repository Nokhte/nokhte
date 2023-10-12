// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'reset_ref_angle_for_max_capacity_store.g.dart';

class ResetRefAngleForMaxCapacityStore = _ResetRefAngleForMaxCapacityStoreBase
    with _$ResetRefAngleForMaxCapacityStore;

abstract class _ResetRefAngleForMaxCapacityStoreBase extends Equatable
    with Store {
  final ResetRefAngleForMaxCapacityGetterStore getterStore;

  _ResetRefAngleForMaxCapacityStoreBase({
    required this.getterStore,
  });

  void call(params) => getterStore(params);

  @override
  List<Object> get props => [];
}
