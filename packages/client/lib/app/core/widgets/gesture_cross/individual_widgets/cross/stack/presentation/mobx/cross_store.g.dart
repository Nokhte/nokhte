// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cross_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CrossStore on _CrossStoreBase, Store {
  late final _$circleInformationAtom =
      Atom(name: '_CrossStoreBase.circleInformation', context: context);

  @override
  ObservableList<CircleInformation> get circleInformation {
    _$circleInformationAtom.reportRead();
    return super.circleInformation;
  }

  @override
  set circleInformation(ObservableList<CircleInformation> value) {
    _$circleInformationAtom.reportWrite(value, super.circleInformation, () {
      super.circleInformation = value;
    });
  }

  @override
  String toString() {
    return '''
circleInformation: ${circleInformation}
    ''';
  }
}
