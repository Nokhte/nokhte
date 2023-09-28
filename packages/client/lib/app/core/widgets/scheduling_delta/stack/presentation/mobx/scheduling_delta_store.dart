// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'scheduling_delta_store.g.dart';

class SchedulingDeltaStore = _SchedulingDeltaStoreBase
    with _$SchedulingDeltaStore;

abstract class _SchedulingDeltaStoreBase extends Equatable with Store {
  @override
  List<Object> get props => [];
}
