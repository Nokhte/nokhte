// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conveyer_belt_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConveyerBeltTextStore on _ConveyerBeltTextStoreBase, Store {
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

  late final _$uiDatesAtom =
      Atom(name: '_ConveyerBeltTextStoreBase.uiDates', context: context);

  @override
  ObservableList<String> get uiDates {
    _$uiDatesAtom.reportRead();
    return super.uiDates;
  }

  @override
  set uiDates(ObservableList<String> value) {
    _$uiDatesAtom.reportWrite(value, super.uiDates, () {
      super.uiDates = value;
    });
  }

  late final _$_ConveyerBeltTextStoreBaseActionController =
      ActionController(name: '_ConveyerBeltTextStoreBase', context: context);

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
currentlySelectedIndex: ${currentlySelectedIndex},
uiDates: ${uiDates},
leftMostValue: ${leftMostValue},
leftValue: ${leftValue},
centerValue: ${centerValue},
rightValue: ${rightValue},
rightMostValue: ${rightMostValue}
    ''';
  }
}
