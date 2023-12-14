// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/mobx/get_on_connectivity_changed_store.dart';
import 'package:nokhte/app/core/widgets/wifi_disconnect_overlay/stack/movies/place_wifi_dot_in_center_movie.dart';
import 'package:simple_animations/simple_animations.dart';
part 'wifi_disconnect_overlay_store.g.dart';

class WifiDisconnectOverlayStore = _WifiDisconnectOverlayStoreBase
    with _$WifiDisconnectOverlayStore;

abstract class _WifiDisconnectOverlayStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  final GetOnConnectivityChangedStore getOnConnectivityChanged;

  _WifiDisconnectOverlayStoreBase({
    required this.getOnConnectivityChanged,
  }) {
    getOnConnectivityChanged.callAndListen();
    setMovie(PlaceWifiDotInCenterMovie.movie);
    toggleWidgetVisibility();
    // connectionReactor();
  }

  connectionReactor({
    required Function onConnected,
    required Function onDisconnected,
  }) =>
      reaction(
          (p0) => getOnConnectivityChanged.isConnected,
          (p0) => attuneWidgetsBasedOnConnection(
                p0,
                onConnected,
                onDisconnected,
              ));

  @action
  attuneWidgetsBasedOnConnection(
    bool isConnected,
    Function onConnected,
    Function onDisconnected,
  ) {
    if (isConnected) {
      if (showWidget) {
        toggleWidgetVisibility();
      }
      onConnected();
      setControl(Control.playReverse);
    } else {
      setControl(Control.play);
      onDisconnected();
      if (!showWidget) {
        toggleWidgetVisibility();
      }
    }
  }
}
