import 'package:dartz/dartz.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class SharedSessionContractImpl implements SharedSessionContract {
  final SharedSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  SharedSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  decidePhonerole(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.decidePhoneRole();
      if (res == 0) {
        return const Right(SessionPhoneRole.talking);
      } else {
        return const Right(SessionPhoneRole.notes);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
