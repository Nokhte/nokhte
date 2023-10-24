// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PortalAPI on _PortalAPIBase, Store {
  late final _$drawingModeAtom =
      Atom(name: '_PortalAPIBase.drawingMode', context: context);

  @override
  DrawingStatus get drawingMode {
    _$drawingModeAtom.reportRead();
    return super.drawingMode;
  }

  @override
  set drawingMode(DrawingStatus value) {
    _$drawingModeAtom.reportWrite(value, super.drawingMode, () {
      super.drawingMode = value;
    });
  }

  late final _$visitedQuadrantsListAtom =
      Atom(name: '_PortalAPIBase.visitedQuadrantsList', context: context);

  @override
  List<int> get visitedQuadrantsList {
    _$visitedQuadrantsListAtom.reportRead();
    return super.visitedQuadrantsList;
  }

  @override
  set visitedQuadrantsList(List<int> value) {
    _$visitedQuadrantsListAtom.reportWrite(value, super.visitedQuadrantsList,
        () {
      super.visitedQuadrantsList = value;
    });
  }

  @override
  String toString() {
    return '''
drawingMode: ${drawingMode},
visitedQuadrantsList: ${visitedQuadrantsList}
    ''';
  }
}
