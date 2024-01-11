// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'waiting_text_store.g.dart';

class WaitingTextStore = _WaitingTextStoreBase with _$WaitingTextStore;

abstract class _WaitingTextStoreBase extends Equatable with Store {
  @override
  List<Object> get props => [];
}
