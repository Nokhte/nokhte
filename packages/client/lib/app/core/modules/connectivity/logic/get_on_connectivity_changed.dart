import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/connectivity/sources/connectivity_remote_source.dart';

class GetOnConnectivityChanged
    implements AbstractNoFailureStreamLogic<ConnectivityResult, NoParams> {
  final ConnectivityRemoteSourceImpl remoteSource;

  GetOnConnectivityChanged({required this.remoteSource});

  @override
  call(params) => remoteSource.getOnConnectivityChanged(params);
}
