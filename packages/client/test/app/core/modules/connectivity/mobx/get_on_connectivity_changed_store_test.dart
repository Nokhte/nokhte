// // ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:mobx/mobx.dart';
// import 'package:equatable/equatable.dart';
// import 'package:nokhte/app/core/interfaces/logic.dart';
// import 'package:nokhte/app/core/modules/connectivity/logic/get_on_connectivity_changed.dart';
// part 'get_on_connectivity_changed_store.g.dart';

// class GetOnConnectivityChangedStore = _GetOnConnectivityChangedStoreBase
//     with _$GetOnConnectivityChangedStore;

// abstract class _GetOnConnectivityChangedStoreBase extends Equatable with Store {
//   late StreamSubscription<ConnectivityResult> streamSub;
//   final GetOnConnectivityChanged logic;

//   _GetOnConnectivityChangedStoreBase({required this.logic});

//   @observable
//   ObservableStream<ConnectivityResult> connectivityStream =
//       ObservableStream(const Stream.empty());

//   @observable
//   ConnectivityResult mostRecentResult = ConnectivityResult.none;

//   @action
//   setMostRecentResult(ConnectivityResult newResult) =>
//       mostRecentResult = newResult;

//   @action
//   callAndListen() {
//     connectivityStream = ObservableStream(logic(NoParams()));
//     streamSub =
//         connectivityStream.listen((value) => setMostRecentResult(value));
//   }

//   dispose() => streamSub.cancel();

//   @override
//   List<Object> get props => [];
// }

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/connectivity/mobx/get_on_connectivity_changed_store.dart';

import '../mocks/connectivity_mocks.mocks.dart';

void main() {
  late GetOnConnectivityChangedStore testStore;
  late MockGetOnConnectivityChanged mockLogic;

  setUp(() {
    mockLogic = MockGetOnConnectivityChanged();
    testStore = GetOnConnectivityChangedStore(logic: mockLogic);
  });

  group("initial values", () {
    test("connectivityStream", () {
      expect(testStore.connectivityStream, emitsDone);
    });

    test("mostRecentResult", () {
      expect(testStore.mostRecentResult, ConnectivityResult.none);
    });
  });

  group("actions", () {
    test("setMostRecentResult", () {
      testStore.setMostRecentResult(ConnectivityResult.bluetooth);
      expect(testStore.mostRecentResult, ConnectivityResult.bluetooth);
    });
    test("callAndListen", () async {
      when(mockLogic(NoParams())).thenAnswer(
          (realInvocation) => Stream.value(ConnectivityResult.mobile));
      await testStore.callAndListen();
      expect(testStore.mostRecentResult, ConnectivityResult.mobile);
    });
  });
}
