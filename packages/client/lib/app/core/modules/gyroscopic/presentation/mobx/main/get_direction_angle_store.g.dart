// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_direction_angle_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetDirectionAngleStore on _GetDirectionAngleStoreBase, Store {
  late final _$userDirectionAtom =
      Atom(name: '_GetDirectionAngleStoreBase.userDirection', context: context);

  @override
  ObservableStream<CompassEvent> get userDirection {
    _$userDirectionAtom.reportRead();
    return super.userDirection;
  }

  @override
  set userDirection(ObservableStream<CompassEvent> value) {
    _$userDirectionAtom.reportWrite(value, super.userDirection, () {
      super.userDirection = value;
    });
  }

  @override
  String toString() {
    return '''
userDirection: ${userDirection}
    ''';
  }
}
