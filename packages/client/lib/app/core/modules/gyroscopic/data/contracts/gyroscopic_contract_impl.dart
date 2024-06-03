import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';

class GyroscopicContractImpl implements GyroscopicContract {
  final GyroscopicRemoteSource remoteSource;

  GyroscopicContractImpl({required this.remoteSource});

  @override
  Stream<PhoneHoldingState> getTiltStream(params) =>
      remoteSource.getTiltStream();

  @override
  checkIfDeviceHasGyroscope(params) async =>
      await remoteSource.checkIfDeviceHasGyroscope();
}
