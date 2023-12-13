import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/connectivity/logic/get_on_connectivity_changed.dart';

import '../mocks/connectivity_mocks.mocks.dart';

void main() {
  late GetOnConnectivityChanged tLogic;
  late MockConnectivityRemoteSourceImpl mockRS;

  setUp(() {
    mockRS = MockConnectivityRemoteSourceImpl();
    tLogic = GetOnConnectivityChanged(remoteSource: mockRS);
  });

  test("call", () {
    when(mockRS.getOnConnectivityChanged(NoParams())).thenAnswer(
        (realInvocation) => Stream.value(ConnectivityResult.bluetooth));
    final res = tLogic(NoParams());
    expect(res, isA<Stream<ConnectivityResult>>());
  });
}
