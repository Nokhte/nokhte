// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_spiral_colors_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderSpiralColorsStore on _OrderSpiralColorsStoreBase, Store {
  late final _$orderedTimesAtom =
      Atom(name: '_OrderSpiralColorsStoreBase.orderedTimes', context: context);

  @override
  List<String> get orderedTimes {
    _$orderedTimesAtom.reportRead();
    return super.orderedTimes;
  }

  @override
  set orderedTimes(List<String> value) {
    _$orderedTimesAtom.reportWrite(value, super.orderedTimes, () {
      super.orderedTimes = value;
    });
  }

  late final _$_OrderSpiralColorsStoreBaseActionController =
      ActionController(name: '_OrderSpiralColorsStoreBase', context: context);

  @override
  void call(NoParams params) {
    final _$actionInfo = _$_OrderSpiralColorsStoreBaseActionController
        .startAction(name: '_OrderSpiralColorsStoreBase.call');
    try {
      return super.call(params);
    } finally {
      _$_OrderSpiralColorsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderedTimes: ${orderedTimes}
    ''';
  }
}
