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
  Computed<bool>? _$leftMostCompOperatorComputed;

  @override
  bool get leftMostCompOperator => (_$leftMostCompOperatorComputed ??=
          Computed<bool>(() => super.leftMostCompOperator,
              name: '_ConveyerBeltTextStoreBase.leftMostCompOperator'))
      .value;
  Computed<int>? _$leftIndexComputed;

  @override
  int get leftIndex =>
      (_$leftIndexComputed ??= Computed<int>(() => super.leftIndex,
              name: '_ConveyerBeltTextStoreBase.leftIndex'))
          .value;
  Computed<bool>? _$leftCompOperatorComputed;

  @override
  bool get leftCompOperator => (_$leftCompOperatorComputed ??= Computed<bool>(
          () => super.leftCompOperator,
          name: '_ConveyerBeltTextStoreBase.leftCompOperator'))
      .value;
  Computed<bool>? _$centerCompOperatorComputed;

  @override
  bool get centerCompOperator => (_$centerCompOperatorComputed ??=
          Computed<bool>(() => super.centerCompOperator,
              name: '_ConveyerBeltTextStoreBase.centerCompOperator'))
      .value;
  Computed<int>? _$rightIndexComputed;

  @override
  int get rightIndex =>
      (_$rightIndexComputed ??= Computed<int>(() => super.rightIndex,
              name: '_ConveyerBeltTextStoreBase.rightIndex'))
          .value;
  Computed<bool>? _$rightCompOperatorComputed;

  @override
  bool get rightCompOperator => (_$rightCompOperatorComputed ??= Computed<bool>(
          () => super.rightCompOperator,
          name: '_ConveyerBeltTextStoreBase.rightCompOperator'))
      .value;
  Computed<int>? _$rightMostIndexComputed;

  @override
  int get rightMostIndex =>
      (_$rightMostIndexComputed ??= Computed<int>(() => super.rightMostIndex,
              name: '_ConveyerBeltTextStoreBase.rightMostIndex'))
          .value;
  Computed<bool>? _$rightMostCompOperatorComputed;

  @override
  bool get rightMostCompOperator => (_$rightMostCompOperatorComputed ??=
          Computed<bool>(() => super.rightMostCompOperator,
              name: '_ConveyerBeltTextStoreBase.rightMostCompOperator'))
      .value;
  Computed<List<bool>>? _$comparisonListComputed;

  @override
  List<bool> get comparisonList => (_$comparisonListComputed ??=
          Computed<List<bool>>(() => super.comparisonList,
              name: '_ConveyerBeltTextStoreBase.comparisonList'))
      .value;
  Computed<List<int>>? _$listIndicesComputed;

  @override
  List<int> get listIndices =>
      (_$listIndicesComputed ??= Computed<List<int>>(() => super.listIndices,
              name: '_ConveyerBeltTextStoreBase.listIndices'))
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

  late final _$currentFocusAtom =
      Atom(name: '_ConveyerBeltTextStoreBase.currentFocus', context: context);

  @override
  DateOrTime get currentFocus {
    _$currentFocusAtom.reportRead();
    return super.currentFocus;
  }

  @override
  set currentFocus(DateOrTime value) {
    _$currentFocusAtom.reportWrite(value, super.currentFocus, () {
      super.currentFocus = value;
    });
  }

  late final _$movieModeAtom =
      Atom(name: '_ConveyerBeltTextStoreBase.movieMode', context: context);

  @override
  ConveyerMovieModes get movieMode {
    _$movieModeAtom.reportRead();
    return super.movieMode;
  }

  @override
  set movieMode(ConveyerMovieModes value) {
    _$movieModeAtom.reportWrite(value, super.movieMode, () {
      super.movieMode = value;
    });
  }

  late final _$uiArrayAtom =
      Atom(name: '_ConveyerBeltTextStoreBase.uiArray', context: context);

  @override
  List<UIArray> get uiArray {
    _$uiArrayAtom.reportRead();
    return super.uiArray;
  }

  @override
  set uiArray(List<UIArray> value) {
    _$uiArrayAtom.reportWrite(value, super.uiArray, () {
      super.uiArray = value;
    });
  }

  late final _$returnEntityAtom =
      Atom(name: '_ConveyerBeltTextStoreBase.returnEntity', context: context);

  @override
  ReturnDateOrTimeEntity get returnEntity {
    _$returnEntityAtom.reportRead();
    return super.returnEntity;
  }

  @override
  set returnEntity(ReturnDateOrTimeEntity value) {
    _$returnEntityAtom.reportWrite(value, super.returnEntity, () {
      super.returnEntity = value;
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
  void setWidgetVisibility(bool newVisiblity) {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.setWidgetVisibility');
    try {
      return super.setWidgetVisibility(newVisiblity);
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUIArray(List<GeneralDateTimeReturnType> inputArr) {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.setUIArray');
    try {
      return super.setUIArray(inputArr);
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
  dynamic setDatesArray(DateTime setDate) {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.setDatesArray');
    try {
      return super.setDatesArray(setDate);
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTimesArray(DateTime setDate) {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.setTimesArray');
    try {
      return super.setTimesArray(setDate);
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initForwardMovie() {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.initForwardMovie');
    try {
      return super.initForwardMovie();
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initBackwardMovie() {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.initBackwardMovie');
    try {
      return super.initBackwardMovie();
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCompletedMovie() {
    final _$actionInfo = _$_ConveyerBeltTextStoreBaseActionController
        .startAction(name: '_ConveyerBeltTextStoreBase.onCompletedMovie');
    try {
      return super.onCompletedMovie();
    } finally {
      _$_ConveyerBeltTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentFocus: ${currentFocus},
movieMode: ${movieMode},
uiArray: ${uiArray},
returnEntity: ${returnEntity},
currentlySelectedIndex: ${currentlySelectedIndex},
leftMostIndex: ${leftMostIndex},
leftMostCompOperator: ${leftMostCompOperator},
leftIndex: ${leftIndex},
leftCompOperator: ${leftCompOperator},
centerCompOperator: ${centerCompOperator},
rightIndex: ${rightIndex},
rightCompOperator: ${rightCompOperator},
rightMostIndex: ${rightMostIndex},
rightMostCompOperator: ${rightMostCompOperator},
comparisonList: ${comparisonList},
listIndices: ${listIndices},
focusListCardinalLength: ${focusListCardinalLength},
theFocusedList: ${theFocusedList}
    ''';
  }
}
