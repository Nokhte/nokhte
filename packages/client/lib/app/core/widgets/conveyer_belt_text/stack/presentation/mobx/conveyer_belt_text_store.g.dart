// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conveyer_belt_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConveyerBeltTextStore on _ConveyerBeltTextStoreBase, Store {
  Computed<int>? _$leftMostIndexComputed;

  @override
  int get leftMostIndex =>
      (_$leftMostIndexComputed ??= Computed<int>(() => super.leftMostIndex,
              name: '_ConveyerBeltTextStoreBase.leftMostIndex'))
          .value;
  Computed<int>? _$leftIndexComputed;

  @override
  int get leftIndex =>
      (_$leftIndexComputed ??= Computed<int>(() => super.leftIndex,
              name: '_ConveyerBeltTextStoreBase.leftIndex'))
          .value;
  Computed<int>? _$rightIndexComputed;

  @override
  int get rightIndex =>
      (_$rightIndexComputed ??= Computed<int>(() => super.rightIndex,
              name: '_ConveyerBeltTextStoreBase.rightIndex'))
          .value;
  Computed<int>? _$rightMostIndexComputed;

  @override
  int get rightMostIndex =>
      (_$rightMostIndexComputed ??= Computed<int>(() => super.rightMostIndex,
              name: '_ConveyerBeltTextStoreBase.rightMostIndex'))
          .value;
  Computed<int>? _$focusListCardinalLengthComputed;

  @override
  int get focusListCardinalLength => (_$focusListCardinalLengthComputed ??=
          Computed<int>(() => super.focusListCardinalLength,
              name: '_ConveyerBeltTextStoreBase.focusListCardinalLength'))
      .value;
  Computed<List<GeneralDateTimeReturnType>>? _$theFocusedListComputed;

  @override
  List<GeneralDateTimeReturnType> get theFocusedList =>
      (_$theFocusedListComputed ??= Computed<List<GeneralDateTimeReturnType>>(
              () => super.theFocusedList,
              name: '_ConveyerBeltTextStoreBase.theFocusedList'))
          .value;
  Computed<String>? _$leftMostValueComputed;

  @override
  String get leftMostValue =>
      (_$leftMostValueComputed ??= Computed<String>(() => super.leftMostValue,
              name: '_ConveyerBeltTextStoreBase.leftMostValue'))
          .value;
  Computed<String>? _$leftValueComputed;

  @override
  String get leftValue =>
      (_$leftValueComputed ??= Computed<String>(() => super.leftValue,
              name: '_ConveyerBeltTextStoreBase.leftValue'))
          .value;
  Computed<String>? _$centerValueComputed;

  @override
  String get centerValue =>
      (_$centerValueComputed ??= Computed<String>(() => super.centerValue,
              name: '_ConveyerBeltTextStoreBase.centerValue'))
          .value;
  Computed<String>? _$rightValueComputed;

  @override
  String get rightValue =>
      (_$rightValueComputed ??= Computed<String>(() => super.rightValue,
              name: '_ConveyerBeltTextStoreBase.rightValue'))
          .value;
  Computed<String>? _$rightMostValueComputed;

  @override
  String get rightMostValue =>
      (_$rightMostValueComputed ??= Computed<String>(() => super.rightMostValue,
              name: '_ConveyerBeltTextStoreBase.rightMostValue'))
          .value;

  late final _$movieAtom =
      Atom(name: '_ConveyerBeltTextStoreBase.movie', context: context);

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

  late final _$controlAtom =
      Atom(name: '_ConveyerBeltTextStoreBase.control', context: context);

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

  late final _$currentlySelectedIndexAtom = Atom(
      name: '_ConveyerBeltTextStoreBase.currentlySelectedIndex',
      context: context);

  @override
  int get currentlySelectedIndex {
    _$currentlySelectedIndexAtom.reportRead();
    return super.currentlySelectedIndex;
  }

  @override
  set currentlySelectedIndex(int value) {
    _$currentlySelectedIndexAtom
        .reportWrite(value, super.currentlySelectedIndex, () {
      super.currentlySelectedIndex = value;
    });
  }

  late final _$_ConveyerBeltTextStoreBaseActionController =
      ActionController(name: '_ConveyerBeltTextStoreBase', context: context);

  @override
  dynamic toggleListFocus() {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.toggleListFocus');
    try {
      return super.toggleListFocus();
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTimesArray() {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.setTimesArray');
    try {
      return super.setTimesArray();
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentlySelectedIndex(int index) {
    final _$actionInfo =
        _$_ConveyerBeltTextStoreBaseActionController.startAction(
            name: '_ConveyerBeltTextStoreBase.setCurrentlySelectedIndex');
    try {
      return super.setCurrentlySelectedIndex(index);
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
control: ${control},
currentlySelectedIndex: ${currentlySelectedIndex},
leftMostIndex: ${leftMostIndex},
leftIndex: ${leftIndex},
rightIndex: ${rightIndex},
rightMostIndex: ${rightMostIndex},
focusListCardinalLength: ${focusListCardinalLength},
theFocusedList: ${theFocusedList},
leftMostValue: ${leftMostValue},
leftValue: ${leftValue},
centerValue: ${centerValue},
rightValue: ${rightValue},
rightMostValue: ${rightMostValue}
    ''';
  }
}
