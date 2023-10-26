// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_delta_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SchedulingDeltaStore on _SchedulingDeltaStoreBase, Store {
  late final _$showWidgetAtom =
      Atom(name: '_SchedulingDeltaStoreBase.showWidget', context: context);

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

  late final _$controlAtom =
      Atom(name: '_SchedulingDeltaStoreBase.control', context: context);

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

  late final _$movieAtom =
      Atom(name: '_SchedulingDeltaStoreBase.movie', context: context);

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

  late final _$_SchedulingDeltaStoreBaseActionController =
      ActionController(name: '_SchedulingDeltaStoreBase', context: context);

  @override
  dynamic resetColorTransition() {
    final _$actionInfo = _$_SchedulingDeltaStoreBaseActionController
        .startAction(name: '_SchedulingDeltaStoreBase.resetColorTransition');
    try {
      return super.resetColorTransition();
    } finally {
      _$_SchedulingDeltaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startColorTransitionMovie() {
    final _$actionInfo =
        _$_SchedulingDeltaStoreBaseActionController.startAction(
            name: '_SchedulingDeltaStoreBase.startColorTransitionMovie');
    try {
      return super.startColorTransitionMovie();
    } finally {
      _$_SchedulingDeltaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backTrackTheTransition() {
    final _$actionInfo = _$_SchedulingDeltaStoreBaseActionController
        .startAction(name: '_SchedulingDeltaStoreBase.backTrackTheTransition');
    try {
      return super.backTrackTheTransition();
    } finally {
      _$_SchedulingDeltaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleWidgetVisibility() {
    final _$actionInfo = _$_SchedulingDeltaStoreBaseActionController
        .startAction(name: '_SchedulingDeltaStoreBase.toggleWidgetVisibility');
    try {
      return super.toggleWidgetVisibility();
    } finally {
      _$_SchedulingDeltaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showWidget: ${showWidget},
control: ${control},
movie: ${movie}
    ''';
  }
}
