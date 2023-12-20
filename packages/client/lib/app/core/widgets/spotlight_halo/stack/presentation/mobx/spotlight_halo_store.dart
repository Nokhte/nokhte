// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'spotlight_halo_store.g.dart';

class SpotlightHaloStore = _SpotlightHaloStoreBase with _$SpotlightHaloStore;

abstract class _SpotlightHaloStoreBase extends Equatable with Store {
  @override
  List<Object> get props => [];
}
