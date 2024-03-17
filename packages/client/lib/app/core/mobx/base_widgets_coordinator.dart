// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'base_widgets_coordinator.g.dart';

class BaseWidgetsCoordinator = _BaseWidgetsCoordinatorBase
    with _$BaseWidgetsCoordinator;

abstract class _BaseWidgetsCoordinatorBase extends Equatable with Store {
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _BaseWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
  });
  @observable
  bool isDisconnected = false;

  @action
  setIsDisconnected(bool newValue) => isDisconnected = newValue;

  @override
  List<Object> get props => [];
}
