// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'window_api.g.dart';

class WindowAPI = _WindowAPIBase with _$WindowAPI;

abstract class _WindowAPIBase extends Equatable with Store {
  @override
  List<Object> get props => [];
}
