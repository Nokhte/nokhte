// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'wifi_disconnect_overlay_store.g.dart';

class WifiDisconnectOverlayStore = _WifiDisconnectOverlayStoreBase
    with _$WifiDisconnectOverlayStore;

abstract class _WifiDisconnectOverlayStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {}
