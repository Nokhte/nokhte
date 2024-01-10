// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'smart_vertical_text_store.g.dart';

class SmartVerticalTextStore = _SmartVerticalTextStoreBase
    with _$SmartVerticalTextStore;

abstract class _SmartVerticalTextStoreBase extends Equatable with Store {
  @override
  List<Object> get props => [];
}
