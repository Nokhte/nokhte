// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'tap_detector.g.dart';

class TapDetector = _TapDetector with _$TapDetector;

abstract class _TapDetector extends Equatable with Store {
  @observable
  int tapCount = 0;

  @action
  onTap() => tapCount++;

  @override
  List<Object> get props => [];
}
