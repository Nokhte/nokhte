// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_tree_node_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GradientTreeNodeStore on _GradientTreeNodeStoreBase, Store {
  late final _$tapCountAtom =
      Atom(name: '_GradientTreeNodeStoreBase.tapCount', context: context);

  @override
  int get tapCount {
    _$tapCountAtom.reportRead();
    return super.tapCount;
  }

  @override
  set tapCount(int value) {
    _$tapCountAtom.reportWrite(value, super.tapCount, () {
      super.tapCount = value;
    });
  }

  late final _$_GradientTreeNodeStoreBaseActionController =
      ActionController(name: '_GradientTreeNodeStoreBase', context: context);

  @override
  dynamic incrementTapCount() {
    final _$actionInfo = _$_GradientTreeNodeStoreBaseActionController
        .startAction(name: '_GradientTreeNodeStoreBase.incrementTapCount');
    try {
      return super.incrementTapCount();
    } finally {
      _$_GradientTreeNodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tapCount: ${tapCount}
    ''';
  }
}
