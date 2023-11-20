// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_custom_animated_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseCustomAnimatedWidgetStore
    on _BaseCustomAnimatedWidgetStoreBase, Store {
  late final _$localStopwatchAtom = Atom(
      name: '_BaseCustomAnimatedWidgetStoreBase.localStopwatch',
      context: context);

  @override
  Stopwatch get localStopwatch {
    _$localStopwatchAtom.reportRead();
    return super.localStopwatch;
  }

  @override
  set localStopwatch(Stopwatch value) {
    _$localStopwatchAtom.reportWrite(value, super.localStopwatch, () {
      super.localStopwatch = value;
    });
  }

  late final _$movieAtom =
      Atom(name: '_BaseCustomAnimatedWidgetStoreBase.movie', context: context);

  @override
  MovieTween get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(MovieTween value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$controlAtom = Atom(
      name: '_BaseCustomAnimatedWidgetStoreBase.control', context: context);

  @override
  Control get control {
    _$controlAtom.reportRead();
    return super.control;
  }

  @override
  set control(Control value) {
    _$controlAtom.reportWrite(value, super.control, () {
      super.control = value;
    });
  }

  late final _$showWidgetAtom = Atom(
      name: '_BaseCustomAnimatedWidgetStoreBase.showWidget', context: context);

  @override
  bool get showWidget {
    _$showWidgetAtom.reportRead();
    return super.showWidget;
  }

  @override
  set showWidget(bool value) {
    _$showWidgetAtom.reportWrite(value, super.showWidget, () {
      super.showWidget = value;
    });
  }

  late final _$movieStatusAtom = Atom(
      name: '_BaseCustomAnimatedWidgetStoreBase.movieStatus', context: context);

  @override
  MovieStatus get movieStatus {
    _$movieStatusAtom.reportRead();
    return super.movieStatus;
  }

  @override
  set movieStatus(MovieStatus value) {
    _$movieStatusAtom.reportWrite(value, super.movieStatus, () {
      super.movieStatus = value;
    });
  }

  late final _$stopwatchMillsecondsAtom = Atom(
      name: '_BaseCustomAnimatedWidgetStoreBase.stopwatchMillseconds',
      context: context);

  @override
  String get stopwatchMillseconds {
    _$stopwatchMillsecondsAtom.reportRead();
    return super.stopwatchMillseconds;
  }

  @override
  set stopwatchMillseconds(String value) {
    _$stopwatchMillsecondsAtom.reportWrite(value, super.stopwatchMillseconds,
        () {
      super.stopwatchMillseconds = value;
    });
  }

  late final _$_BaseCustomAnimatedWidgetStoreBaseActionController =
      ActionController(
          name: '_BaseCustomAnimatedWidgetStoreBase', context: context);

  @override
  dynamic toggleWidgetVisibilty() {
    final _$actionInfo =
        _$_BaseCustomAnimatedWidgetStoreBaseActionController.startAction(
            name: '_BaseCustomAnimatedWidgetStoreBase.toggleWidgetVisibilty');
    try {
      return super.toggleWidgetVisibilty();
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMovie(MovieTween newMovie) {
    final _$actionInfo = _$_BaseCustomAnimatedWidgetStoreBaseActionController
        .startAction(name: '_BaseCustomAnimatedWidgetStoreBase.setMovie');
    try {
      return super.setMovie(newMovie);
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setControl(Control newControl) {
    final _$actionInfo = _$_BaseCustomAnimatedWidgetStoreBaseActionController
        .startAction(name: '_BaseCustomAnimatedWidgetStoreBase.setControl');
    try {
      return super.setControl(newControl);
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic startAndResetStopWatch() {
    final _$actionInfo =
        _$_BaseCustomAnimatedWidgetStoreBaseActionController.startAction(
            name: '_BaseCustomAnimatedWidgetStoreBase.startAndResetStopWatch');
    try {
      return super.startAndResetStopWatch();
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
localStopwatch: ${localStopwatch},
movie: ${movie},
control: ${control},
showWidget: ${showWidget},
movieStatus: ${movieStatus},
stopwatchMillseconds: ${stopwatchMillseconds}
    ''';
  }
}
