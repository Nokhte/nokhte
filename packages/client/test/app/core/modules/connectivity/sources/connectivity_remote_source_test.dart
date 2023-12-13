import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/connectivity/sources/connectivity_remote_source.dart';
import '../mocks/connectivity_mocks.mocks.dart';

void main() {
  late ConnectivityRemoteSourceImpl testRS;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    testRS = ConnectivityRemoteSourceImpl(
      connectivity: mockConnectivity,
    );
  });

  test("getOnConnectivityChanged", () {
    when(mockConnectivity.onConnectivityChanged).thenAnswer(
        (realInvocation) => Stream.value(ConnectivityResult.bluetooth));
    final res = testRS.getOnConnectivityChanged(NoParams());
    expect(res, isA<Stream<ConnectivityResult>>());
  });
}
