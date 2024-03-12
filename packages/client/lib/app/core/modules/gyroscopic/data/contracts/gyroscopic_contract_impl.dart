import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:nokhte/app/core/modules/gyroscopic/data/data.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/phone_holding_state.dart';

class GyroscopicContractImpl implements GyroscopicContract {
  final GyroscopicRemoteSource remoteSource;

  GyroscopicContractImpl({required this.remoteSource});

  @override
  Stream<PhoneHoldingState> getTiltStream(params) =>
      remoteSource.getTiltStream();
}
