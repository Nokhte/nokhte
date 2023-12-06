// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'window_api.g.dart';

class WindowAPI = _WindowAPIBase with _$WindowAPI;

abstract class _WindowAPIBase extends Equatable with Store {
  @override
  List<Object> get props => [];
}
