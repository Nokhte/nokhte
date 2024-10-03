import 'package:nokhte/app/modules/settings/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';

abstract class SettingsContract {
  Future<bool> logOut();
}

class SettingsContractImpl implements SettingsContract {
  final SettingsRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  SettingsContractImpl({required this.remoteSource, required this.networkInfo});

  @override
  logOut() async {
    if (await networkInfo.isConnected) {
      await remoteSource.logout();
      return true;
    } else {
      return false;
    }
  }
}
