// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'hold_detector.g.dart';

class HoldDetector = _HoldDetector with _$HoldDetector;

abstract class _HoldDetector extends Equatable with Store {
  @observable
  double screenHeight = -1;

  @action
  setScreenHeight(double value) => screenHeight = value;

  @computed
  GesturePlacement get placement =>
      currentHoldPosition.dy.isLessThan(screenHeight.half())
          ? GesturePlacement.topHalf
          : GesturePlacement.bottomHalf;

  @observable
  Offset currentHoldPosition = Offset.zero;

  @observable
  int holdCount = 0;

  @observable
  int letGoCount = 0;

  @action
  onHold(Offset position) {
    currentHoldPosition = position;
    holdCount++;
  }

  onLetGo() => letGoCount++;

  @override
  List<Object> get props => [];
}
