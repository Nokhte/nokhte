// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solo_text_editor_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SoloTextEditorTrackerStore on _SoloTextEditorTrackerStoreBase, Store {
  late final _$showWidgetAtom = Atom(
      name: '_SoloTextEditorTrackerStoreBase.showWidget', context: context);

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

  late final _$_SoloTextEditorTrackerStoreBaseActionController =
      ActionController(
          name: '_SoloTextEditorTrackerStoreBase', context: context);

  @override
  dynamic flipWidgetVisibility() {
    final _$actionInfo =
        _$_SoloTextEditorTrackerStoreBaseActionController.startAction(
            name: '_SoloTextEditorTrackerStoreBase.flipWidgetVisibility');
    try {
      return super.flipWidgetVisibility();
    } finally {
      _$_SoloTextEditorTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showWidget: ${showWidget}
    ''';
  }
}
