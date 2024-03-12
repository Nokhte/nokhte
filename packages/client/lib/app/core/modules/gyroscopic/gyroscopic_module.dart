import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/data/data.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:nokhte/app/core/modules/gyroscopic/mobx/mobx.dart';

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
    i.add<GetTiltStreamStore>(
      () => GetTiltStreamStore(
        logic: Modular.get<GetTiltStream>(),
      ),
    );
  }
}
