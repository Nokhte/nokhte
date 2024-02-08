// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_nokhte_session_metadata_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetNokhteSessionMetadataStore
    on _GetNokhteSessionMetadataStoreBase, Store {
  Computed<bool>? _$isAllowedToExitComputed;

  @override
  bool get isAllowedToExit =>
      (_$isAllowedToExitComputed ??= Computed<bool>(() => super.isAllowedToExit,
              name: '_GetNokhteSessionMetadataStoreBase.isAllowedToExit'))
          .value;
  Computed<bool>? _$userWantsToExitComputed;

  @override
  bool get userWantsToExit =>
      (_$userWantsToExitComputed ??= Computed<bool>(() => super.userWantsToExit,
              name: '_GetNokhteSessionMetadataStoreBase.userWantsToExit'))
          .value;
  Computed<bool>? _$collaboratorWantsToExitComputed;

  @override
  bool get collaboratorWantsToExit => (_$collaboratorWantsToExitComputed ??=
          Computed<bool>(() => super.collaboratorWantsToExit,
              name:
                  '_GetNokhteSessionMetadataStoreBase.collaboratorWantsToExit'))
      .value;

  late final _$getAsyncAction =
      AsyncAction('_GetNokhteSessionMetadataStoreBase.get', context: context);

  @override
  Future<void> get(dynamic params) {
    return _$getAsyncAction.run(() => super.get(params));
  }

  @override
  String toString() {
    return '''
isAllowedToExit: ${isAllowedToExit},
userWantsToExit: ${userWantsToExit},
collaboratorWantsToExit: ${collaboratorWantsToExit}
    ''';
  }
}
