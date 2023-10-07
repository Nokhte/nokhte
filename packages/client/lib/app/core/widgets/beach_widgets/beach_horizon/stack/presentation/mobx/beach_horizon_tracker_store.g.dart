// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beach_horizon_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeachHorizonTrackerStore on _BeachHorizonTrackerStoreBase, Store {
  late final _$movieAtom =
      Atom(name: '_BeachHorizonTrackerStoreBase.movie', context: context);

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

  late final _$passingParamAtom = Atom(
      name: '_BeachHorizonTrackerStoreBase.passingParam', context: context);

  @override
  double get passingParam {
    _$passingParamAtom.reportRead();
    return super.passingParam;
  }

  @override
  set passingParam(double value) {
    _$passingParamAtom.reportWrite(value, super.passingParam, () {
      super.passingParam = value;
    });
  }

  late final _$controlAtom =
      Atom(name: '_BeachHorizonTrackerStoreBase.control', context: context);

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

  @override
  String toString() {
    return '''
movie: ${movie},
passingParam: ${passingParam},
control: ${control}
    ''';
  }
}
