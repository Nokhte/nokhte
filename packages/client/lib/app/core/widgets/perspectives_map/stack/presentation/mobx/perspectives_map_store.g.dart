// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perspectives_map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerspectivesMapStore on _PerspectivesMapStoreBase, Store {
  late final _$wantToFadeOutAtom =
      Atom(name: '_PerspectivesMapStoreBase.wantToFadeOut', context: context);

  @override
  bool get wantToFadeOut {
    _$wantToFadeOutAtom.reportRead();
    return super.wantToFadeOut;
  }

  @override
  set wantToFadeOut(bool value) {
    _$wantToFadeOutAtom.reportWrite(value, super.wantToFadeOut, () {
      super.wantToFadeOut = value;
    });
  }

  late final _$showWidgetAtom =
      Atom(name: '_PerspectivesMapStoreBase.showWidget', context: context);

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
      Atom(name: '_PerspectivesMapStoreBase.movie', context: context);

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

  late final _$pillControllerAtom =
      Atom(name: '_PerspectivesMapStoreBase.pillController', context: context);

  @override
  Control get pillController {
    _$pillControllerAtom.reportRead();
    return super.pillController;
  }

  @override
  set pillController(Control value) {
    _$pillControllerAtom.reportWrite(value, super.pillController, () {
      super.pillController = value;
    });
  }

  late final _$_PerspectivesMapStoreBaseActionController =
      ActionController(name: '_PerspectivesMapStoreBase', context: context);

  @override
  dynamic setFadeOut(bool newFadeStatus) {
    final _$actionInfo = _$_PerspectivesMapStoreBaseActionController
        .startAction(name: '_PerspectivesMapStoreBase.setFadeOut');
    try {
      return super.setFadeOut(newFadeStatus);
    } finally {
      _$_PerspectivesMapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPillAnimationControl(Control newControl) {
    final _$actionInfo = _$_PerspectivesMapStoreBaseActionController
        .startAction(name: '_PerspectivesMapStoreBase.setPillAnimationControl');
    try {
      return super.setPillAnimationControl(newControl);
    } finally {
      _$_PerspectivesMapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPillMovie(MovieTween newMovie) {
    final _$actionInfo = _$_PerspectivesMapStoreBaseActionController
        .startAction(name: '_PerspectivesMapStoreBase.setPillMovie');
    try {
      return super.setPillMovie(newMovie);
    } finally {
      _$_PerspectivesMapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic animationRenderingCallback(int i, Offset z) {
    final _$actionInfo =
        _$_PerspectivesMapStoreBaseActionController.startAction(
            name: '_PerspectivesMapStoreBase.animationRenderingCallback');
    try {
      return super.animationRenderingCallback(i, z);
    } finally {
      _$_PerspectivesMapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAnimationCompleted() {
    final _$actionInfo = _$_PerspectivesMapStoreBaseActionController
        .startAction(name: '_PerspectivesMapStoreBase.onAnimationCompleted');
    try {
      return super.onAnimationCompleted();
    } finally {
      _$_PerspectivesMapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wantToFadeOut: ${wantToFadeOut},
showWidget: ${showWidget},
movie: ${movie},
pillController: ${pillController}
    ''';
  }
}
