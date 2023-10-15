// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'conveyer_belt_text_store.g.dart';

class ConveryerBeltTextStore = _ConveryerBeltTextStoreBase
    with _$ConveryerBeltTextStore;

abstract class _ConveryerBeltTextStoreBase extends Equatable with Store {
  @override
  List<Object> get props => [];
}
