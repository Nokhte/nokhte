// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_request_times_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SchedulingRequestTimesStore on _SchedulingRequestTimesStoreBase, Store {
  late final _$selectedStateAtom = Atom(
      name: '_SchedulingRequestTimesStoreBase.selectedState', context: context);

  @override
  Either<List<IndividualTimeRange>, String> get selectedState {
    _$selectedStateAtom.reportRead();
    return super.selectedState;
  }

  @override
  set selectedState(Either<List<IndividualTimeRange>, String> value) {
    _$selectedStateAtom.reportWrite(value, super.selectedState, () {
      super.selectedState = value;
    });
  }

  late final _$_SchedulingRequestTimesStoreBaseActionController =
      ActionController(
          name: '_SchedulingRequestTimesStoreBase', context: context);

  @override
  dynamic updateState(SpiralCircleEntity touchPayload) {
    final _$actionInfo = _$_SchedulingRequestTimesStoreBaseActionController
        .startAction(name: '_SchedulingRequestTimesStoreBase.updateState');
    try {
      return super.updateState(touchPayload);
    } finally {
      _$_SchedulingRequestTimesStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedState: ${selectedState}
    ''';
  }
}
