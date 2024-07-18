// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:simple_animations/simple_animations.dart';
part 'wifi_disconnect_overlay_store.g.dart';

class WifiDisconnectOverlayStore = _WifiDisconnectOverlayStoreBase
    with _$WifiDisconnectOverlayStore;

abstract class _WifiDisconnectOverlayStoreBase extends BaseWidgetStore
    with Store {
  final GetOnConnectivityChangedStore getOnConnectivityChanged;

  _WifiDisconnectOverlayStoreBase({
    required this.getOnConnectivityChanged,
  }) {
    getOnConnectivityChanged.callAndListen();
    setMovie(WifiDisconnectOverlayMovies.placeTheCircle);
    toggleWidgetVisibility();
  }

  @observable
  Stopwatch disconnectedStopwatch = Stopwatch();

  @observable
  WifiDisconnectMovieModes movieMode = WifiDisconnectMovieModes.initial;

  @action
  setMovieMode(WifiDisconnectMovieModes newMovieModes) =>
      movieMode = newMovieModes;

  List<ReactionDisposer> initReactors({
    required Function onQuickConnected,
    required Function onLongReConnected,
    required Function onDisconnected,
  }) {
    List<ReactionDisposer> temp = [];
    temp.add(connectionReactor(
      onQuickConnected: onQuickConnected,
      onDisconnected: onDisconnected,
    ));
    temp.add(onCompletedReactor(onLongReConnected));
    return temp;
  }

  connectionReactor({
    required Function onQuickConnected,
    required Function onDisconnected,
  }) =>
      reaction(
          (p0) => getOnConnectivityChanged.isConnected,
          (p0) => attuneWidgetsBasedOnConnection(
                p0,
                onQuickConnected,
                onDisconnected,
              ));

  @action
  attuneWidgetsBasedOnConnection(
    bool isConnected,
    Function onConnected,
    Function onDisconnected,
  ) {
    if (isConnected) {
      disconnectedStopwatch.stop();
      if (showWidget) {
        toggleWidgetVisibility();
      }
      if (disconnectedStopwatch.elapsedMilliseconds.isLessThan(1000)) {
        onConnected();
        initPlaceTheCircle(theControl: Control.playReverse);
      } else {
        initLoopMovie(theControl: Control.playReverse);
      }
      disconnectedStopwatch.reset();
    } else {
      disconnectedStopwatch.start();
      initPlaceTheCircle();
      onDisconnected();
    }
  }

  @action
  initPlaceTheCircle({Control theControl = Control.playFromStart}) {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(WifiDisconnectOverlayMovies.placeTheCircle);
    setControl(theControl);
    setMovieMode(WifiDisconnectMovieModes.placeTheCircle);
  }

  initLoopMovie({Control theControl = Control.loop}) {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(WifiDisconnectOverlayMovies.liveRipple);
    setMovieMode(WifiDisconnectMovieModes.rippleLoop);
    setControl(theControl);
  }

  initRemoveTheCircle() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(WifiDisconnectOverlayMovies.removeTheCircle);
    setMovie(WifiDisconnectOverlayMovies.removeTheCircle);
    setMovieMode(WifiDisconnectMovieModes.removeTheCircle);
    setControl(Control.playFromStart);
  }

  onCompletedReactor(Function onLongReconnected) =>
      reaction((p0) => movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (movieMode == WifiDisconnectMovieModes.placeTheCircle &&
              pastControl == Control.playFromStart) {
            initLoopMovie();
          } else if (movieMode == WifiDisconnectMovieModes.rippleLoop) {
            if (pastControl == Control.playReverse) {
              initRemoveTheCircle();
            }
          } else if (movieMode == WifiDisconnectMovieModes.removeTheCircle) {
            onLongReconnected();
          }
        }
      });
}
