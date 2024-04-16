import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/data/data.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:nokhte/app/core/modules/gyroscopic/mobx/mobx.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'mobx/mobx.dart';
export 'types/types.dart';

class GyroscopicModule extends Module {
  @override
  exportedBinds(i) {
    i.add<GyroscopicRemoteSourceImpl>(
      () => GyroscopicRemoteSourceImpl(
        tilt: DeviceTilt(
          samplingRateMs: 20,
        ),
      ),
    );
    i.add<GyroscopicContractImpl>(
      () => GyroscopicContractImpl(
        remoteSource: Modular.get<GyroscopicRemoteSourceImpl>(),
      ),
    );
    i.add<GetTiltStream>(
      () => GetTiltStream(
        contract: Modular.get<GyroscopicContractImpl>(),
      ),
    );
    i.add<CheckIfDeviceHasGyroscope>(
      () => CheckIfDeviceHasGyroscope(
        contract: Modular.get<GyroscopicContractImpl>(),
      ),
    );
    i.add<GyroscopicCoordinator>(
      () => GyroscopicCoordinator(
        getTiltStreamLogic: Modular.get<GetTiltStream>(),
        checkIfDeviceHasGyroscopeLogic:
            Modular.get<CheckIfDeviceHasGyroscope>(),
      ),
    );
  }
}
