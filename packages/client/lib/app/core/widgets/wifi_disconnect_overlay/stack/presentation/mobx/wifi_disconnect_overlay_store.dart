// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/mobx/get_on_connectivity_changed_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
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
    setMovie(WifiRippleMovie.movie);
    onCompletedReactor();
    toggleWidgetVisibility();
  }

  @observable
  WifiDisconnectMovieModes movieMode = WifiDisconnectMovieModes.initial;

  @action
  setMovieMode(WifiDisconnectMovieModes newMovieModes) =>
      movieMode = newMovieModes;

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
      // initRemoveTheCircle();
      // setControl(Control.playReverse);
    } else {
      // setControl(Control.play);
      initPlaceTheCircle();
      onDisconnected();
    }
  }

  initPlaceTheCircle() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(PlaceTheCircleMovie.movie);
    setControl(Control.playFromStart);
    setMovieMode(WifiDisconnectMovieModes.placeTheCircle);
  }

  initLoopMovie() {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(WifiRippleMovie.movie);
    setMovieMode(WifiDisconnectMovieModes.rippleLoop);
    setControl(Control.playFromStart);
  }

  @observable
  int rippleCount = 0;

  @action
  incrementRippleCount() => rippleCount++;

  @action
  resetRippleCount() => rippleCount = 0;

  onCompletedReactor() => reaction((p0) => movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            movieMode == WifiDisconnectMovieModes.placeTheCircle) {
          initLoopMovie();
        } else if (p0 == MovieStatus.finished &&
            movieMode == WifiDisconnectMovieModes.rippleLoop) {
          if (rippleCount < 2) {
            initLoopMovie();
            incrementRippleCount();
          }
        }
        // if (p0 == MovieStatus.finished && pastControl == Control.play) {
        //   if (!showWidget) {
        //     toggleWidgetVisibility();
        //   }
        // }
      });
}
