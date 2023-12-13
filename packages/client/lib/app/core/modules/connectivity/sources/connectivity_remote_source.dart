import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class ConnectivityRemoteSource {
  Stream<ConnectivityResult> getOnConnectivityChanged(NoParams params);
}

class ConnectivityRemoteSourceImpl implements ConnectivityRemoteSource {
  final Connectivity connectivity;
  ConnectivityRemoteSourceImpl({
    required this.connectivity,
  });

  @override
  getOnConnectivityChanged(params) => connectivity.onConnectivityChanged;
}
