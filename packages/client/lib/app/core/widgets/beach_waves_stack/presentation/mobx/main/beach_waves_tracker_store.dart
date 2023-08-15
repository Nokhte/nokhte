// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'beach_waves_tracker_store.g.dart';

class BeachWavesTrackerStore = _BeachWavesTrackerStoreBase
    with _$BeachWavesTrackerStore;

abstract class _BeachWavesTrackerStoreBase extends Equatable with Store {
  @override
  List<Object> get props => [
// some items
      ];
}
