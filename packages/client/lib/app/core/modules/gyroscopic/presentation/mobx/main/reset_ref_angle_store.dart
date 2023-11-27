// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
part 'reset_ref_angle_store.g.dart';

class ResetRefAngleStore = _ResetRefAngleStoreBase with _$ResetRefAngleStore;

abstract class _ResetRefAngleStoreBase extends Equatable with Store {
  final ResetRefAngle logic;

  _ResetRefAngleStoreBase({
    required this.logic,
  });

  void call(params) => logic(params);

  @override
  List<Object> get props => [];
}
