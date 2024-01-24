// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_disconnect_overlay_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WifiDisconnectOverlayStore on _WifiDisconnectOverlayStoreBase, Store {
  late final _$disconnectedStopwatchAtom = Atom(
      name: '_WifiDisconnectOverlayStoreBase.disconnectedStopwatch',
      context: context);

  @override
  Stopwatch get disconnectedStopwatch {
    _$disconnectedStopwatchAtom.reportRead();
    return super.disconnectedStopwatch;
  }

  @override
  set disconnectedStopwatch(Stopwatch value) {
    _$disconnectedStopwatchAtom.reportWrite(value, super.disconnectedStopwatch,
        () {
      super.disconnectedStopwatch = value;
    });
  }

  late final _$movieModeAtom =
      Atom(name: '_WifiDisconnectOverlayStoreBase.movieMode', context: context);

  @override
  WifiDisconnectMovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(WifiDisconnectMovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
    });
  }

  late final _$_WifiDisconnectOverlayStoreBaseActionController =
      ActionController(
          name: '_WifiDisconnectOverlayStoreBase', context: context);

  @override
  dynamic setMovieMode(WifiDisconnectMovieModes newMovieModes) {
    final _$actionInfo = _$_WifiDisconnectOverlayStoreBaseActionController
        .startAction(name: '_WifiDisconnectOverlayStoreBase.setMovieMode');
    try {
      return super.setMovieMode(newMovieModes);
    } finally {
      _$_WifiDisconnectOverlayStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic attuneWidgetsBasedOnConnection(
      bool isConnected, Function onConnected, Function onDisconnected) {
    final _$actionInfo =
        _$_WifiDisconnectOverlayStoreBaseActionController.startAction(
            name:
                '_WifiDisconnectOverlayStoreBase.attuneWidgetsBasedOnConnection');
    try {
      return super.attuneWidgetsBasedOnConnection(
          isConnected, onConnected, onDisconnected);
    } finally {
      _$_WifiDisconnectOverlayStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initPlaceTheCircle({Control theControl = Control.playFromStart}) {
    final _$actionInfo =
        _$_WifiDisconnectOverlayStoreBaseActionController.startAction(
            name: '_WifiDisconnectOverlayStoreBase.initPlaceTheCircle');
    try {
      return super.initPlaceTheCircle(theControl: theControl);
    } finally {
      _$_WifiDisconnectOverlayStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
disconnectedStopwatch: ${disconnectedStopwatch},
movieMode: ${movieMode}
    ''';
  }
}
