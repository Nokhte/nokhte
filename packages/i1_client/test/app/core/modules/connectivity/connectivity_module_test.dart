import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity_module.dart';
import './connectivity_module.mocks.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MConnectivity extends Mock implements Connectivity {}

@GenerateMocks([MConnectivity])
void main() {
  final connectivityMock = MockMConnectivity();

  setUp(() {
    initModule(ConnectivityModule(connectivityInstance: connectivityMock),
        replaceBinds: [Bind.instance<Connectivity>(connectivityMock)]);
  });

  test("should bind Connectivity Instance to the Module", () {
    final connectivity = Modular.get<Connectivity>();
    expect(connectivity, isA<Connectivity>());
  });
}
