import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/modules/connectivity/logic/get_on_connectivity_changed.dart';
import 'package:nokhte/app/core/modules/connectivity/sources/connectivity_remote_source.dart';

@GenerateMocks([
  Connectivity,
  ConnectivityRemoteSourceImpl,
  GetOnConnectivityChanged,
])
void main() {}
