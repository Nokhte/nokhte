// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'base_home_screen_widgets_coordinator.g.dart';

class BaseHomeScreenWidgetsCoordinator = _BaseHomeScreenWidgetsCoordinatorBase
    with _$BaseHomeScreenWidgetsCoordinator;

abstract class _BaseHomeScreenWidgetsCoordinatorBase
    with Store, Reactions, SmartTextPaddingAdjuster, BaseWidgetsCoordinator {
  final NokhteBlurStore nokhteBlur;
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final BeachWavesStore beachWaves;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _BaseHomeScreenWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
    required this.touchRipple,
    required this.centerInstructionalNokhte,
  }) {
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
  }
}
