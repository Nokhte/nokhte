// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_custom_animated_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseCustomAnimatedWidgetStore<T>
    on _BaseCustomAnimatedWidgetStoreBase<T>, Store {
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

  late final _$pastControlAtom = Atom(
      name: '_BaseCustomAnimatedWidgetStoreBase.pastControl', context: context);

  @override
  Control get pastControl {
    _$pastControlAtom.reportRead();
    return super.pastControl;
  }

  @override
  set pastControl(Control value) {
    _$pastControlAtom.reportWrite(value, super.pastControl, () {
      super.pastControl = value;
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

  late final _$hasFadedInAtom = Atom(
      name: '_BaseCustomAnimatedWidgetStoreBase.hasFadedIn', context: context);

  @override
  bool get hasFadedIn {
    _$hasFadedInAtom.reportRead();
    return super.hasFadedIn;
  }

  @override
  set hasFadedIn(bool value) {
    _$hasFadedInAtom.reportWrite(value, super.hasFadedIn, () {
      super.hasFadedIn = value;
    });
  }

  late final _$_BaseCustomAnimatedWidgetStoreBaseActionController =
      ActionController(
          name: '_BaseCustomAnimatedWidgetStoreBase', context: context);

  @override
  dynamic toggleHasFadedIn() {
    final _$actionInfo =
        _$_BaseCustomAnimatedWidgetStoreBaseActionController.startAction(
            name: '_BaseCustomAnimatedWidgetStoreBase.toggleHasFadedIn');
    try {
      return super.toggleHasFadedIn();
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleWidgetVisibility() {
    final _$actionInfo =
        _$_BaseCustomAnimatedWidgetStoreBaseActionController.startAction(
            name: '_BaseCustomAnimatedWidgetStoreBase.toggleWidgetVisibility');
    try {
      return super.toggleWidgetVisibility();
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPastControl(Control newControl) {
    final _$actionInfo = _$_BaseCustomAnimatedWidgetStoreBaseActionController
        .startAction(name: '_BaseCustomAnimatedWidgetStoreBase.setPastControl');
    try {
      return super.setPastControl(newControl);
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
  dynamic onCompleted() {
    final _$actionInfo = _$_BaseCustomAnimatedWidgetStoreBaseActionController
        .startAction(name: '_BaseCustomAnimatedWidgetStoreBase.onCompleted');
    try {
      return super.onCompleted();
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMovieStatus(MovieStatus newMovieStatus) {
    final _$actionInfo = _$_BaseCustomAnimatedWidgetStoreBaseActionController
        .startAction(name: '_BaseCustomAnimatedWidgetStoreBase.setMovieStatus');
    try {
      return super.setMovieStatus(newMovieStatus);
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic initMovie(T param) {
    final _$actionInfo = _$_BaseCustomAnimatedWidgetStoreBaseActionController
        .startAction(name: '_BaseCustomAnimatedWidgetStoreBase.initMovie');
    try {
      return super.initMovie(param);
    } finally {
      _$_BaseCustomAnimatedWidgetStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
control: ${control},
pastControl: ${pastControl},
showWidget: ${showWidget},
movieStatus: ${movieStatus},
hasFadedIn: ${hasFadedIn}
    ''';
  }
}
