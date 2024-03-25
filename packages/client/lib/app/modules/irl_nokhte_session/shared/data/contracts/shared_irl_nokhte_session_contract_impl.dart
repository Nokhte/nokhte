import 'package:dartz/dartz.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class SharedIrlNokhteSessionContractImpl
    implements SharedIrlNokhteSessionContract {
  final SharedIrlNokhteSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  SharedIrlNokhteSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  decidePhonerole(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.decidePhoneRole();
      if (res == 0) {
        return const Right(IrlNokhteSessionPhoneRole.talking);
      } else {
        return const Right(IrlNokhteSessionPhoneRole.notes);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
