// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'hold_detector.g.dart';

class HoldDetector = _HoldDetector with _$HoldDetector;

abstract class _HoldDetector extends Equatable with Store {
  @observable
  int holdCount = 0;

  @observable
  int letGoCount = 0;

  @action
  onHold() => holdCount++;

  onLetGo() => letGoCount++;

  @override
  List<Object> get props => [];
}
