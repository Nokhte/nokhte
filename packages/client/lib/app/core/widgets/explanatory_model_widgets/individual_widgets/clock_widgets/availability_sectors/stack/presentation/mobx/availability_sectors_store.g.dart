// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_sectors_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AvailabilitySectorsStore on _AvailabilitySectorsStoreBase, Store {
  late final _$isDisconnectedAtom = Atom(
      name: '_AvailabilitySectorsStoreBase.isDisconnected', context: context);

  @override
  bool get isDisconnected {
    _$isDisconnectedAtom.reportRead();
    return super.isDisconnected;
  }

  @override
  set isDisconnected(bool value) {
    _$isDisconnectedAtom.reportWrite(value, super.isDisconnected, () {
      super.isDisconnected = value;
    });
  }

  late final _$movieModeAtom =
      Atom(name: '_AvailabilitySectorsStoreBase.movieMode', context: context);

  @override
  AvailabilitySectorMovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(AvailabilitySectorMovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
    });
  }

  late final _$_AvailabilitySectorsStoreBaseActionController =
      ActionController(name: '_AvailabilitySectorsStoreBase', context: context);

  @override
  dynamic setMovieMode(AvailabilitySectorMovieModes newMovieMode) {
    final _$actionInfo = _$_AvailabilitySectorsStoreBaseActionController
        .startAction(name: '_AvailabilitySectorsStoreBase.setMovieMode');
    try {
      return super.setMovieMode(newMovieMode);
    } finally {
      _$_AvailabilitySectorsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initJoinAndFadeOutMovie() {
    final _$actionInfo =
        _$_AvailabilitySectorsStoreBaseActionController.startAction(
            name: '_AvailabilitySectorsStoreBase.initJoinAndFadeOutMovie');
    try {
      return super.initJoinAndFadeOutMovie();
    } finally {
      _$_AvailabilitySectorsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDisconnected: ${isDisconnected},
movieMode: ${movieMode}
    ''';
  }
}
