// Mocks generated by Mockito 5.4.4 from annotations
// in nokhte/test/app/core/guards/auth_guard_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_modular/flutter_modular.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

import 'auth_guard_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MModule].
///
/// See the documentation for Mockito's code generation for more information.
class MockMModule extends _i1.Mock implements _i2.MModule {
  MockMModule() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.Module> get imports => (super.noSuchMethod(
        Invocation.getter(#imports),
        returnValue: <_i3.Module>[],
      ) as List<_i3.Module>);

  @override
  void binds(_i3.Injector? i) => super.noSuchMethod(
        Invocation.method(
          #binds,
          [i],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void exportedBinds(_i3.Injector? i) => super.noSuchMethod(
        Invocation.method(
          #exportedBinds,
          [i],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void routes(_i3.RouteManager? r) => super.noSuchMethod(
        Invocation.method(
          #routes,
          [r],
        ),
        returnValueForMissingStub: null,
      );
}
