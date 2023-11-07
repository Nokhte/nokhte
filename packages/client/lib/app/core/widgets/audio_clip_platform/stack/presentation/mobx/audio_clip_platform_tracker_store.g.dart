// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_clip_platform_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AudioClipPlatformTrackerStore
    on _AudioClipPlatformTrackerStoreBase, Store {
  late final _$showWidgetAtom = Atom(
      name: '_AudioClipPlatformTrackerStoreBase.showWidget', context: context);

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

  late final _$movieAtom =
      Atom(name: '_AudioClipPlatformTrackerStoreBase.movie', context: context);

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
      name: '_AudioClipPlatformTrackerStoreBase.control', context: context);

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

  late final _$_AudioClipPlatformTrackerStoreBaseActionController =
      ActionController(
          name: '_AudioClipPlatformTrackerStoreBase', context: context);

  @override
  dynamic setMovie(MovieTween newMovie) {
    final _$actionInfo = _$_AudioClipPlatformTrackerStoreBaseActionController
        .startAction(name: '_AudioClipPlatformTrackerStoreBase.setMovie');
    try {
      return super.setMovie(newMovie);
    } finally {
      _$_AudioClipPlatformTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void toggleWidgetVisibility() {
    final _$actionInfo =
        _$_AudioClipPlatformTrackerStoreBaseActionController.startAction(
            name: '_AudioClipPlatformTrackerStoreBase.toggleWidgetVisibility');
    try {
      return super.toggleWidgetVisibility();
    } finally {
      _$_AudioClipPlatformTrackerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showWidget: ${showWidget},
movie: ${movie},
control: ${control}
    ''';
  }
}
