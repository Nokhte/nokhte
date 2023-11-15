import 'package:nokhte/app/core/modules/gyroscopic/data/data.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class GyroscopicModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<GyroscopicRemoteSourceImpl>(
          (i) => GyroscopicRemoteSourceImpl(),
          export: true,
        ),
        Bind.singleton<GyroscopicContractImpl>(
          (i) => GyroscopicContractImpl(
            networkInfo: Modular.get<NetworkInfoImpl>(),
            remoteSource: i<GyroscopicRemoteSource>(),
          ),
          export: true,
        ),
        Bind.singleton<GetDirectionAngle>(
          (i) => GetDirectionAngle(
            contract: i<GyroscopicContract>(),
          ),
          export: true,
        ),
        Bind.singleton<SetReferenceAngle>(
          (i) => SetReferenceAngle(
            contract: i<GyroscopicContract>(),
          ),
          export: true,
        ),
        Bind.singleton<ResetRefAngle>(
          (i) => ResetRefAngle(
            contract: i<GyroscopicContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetDirectionAngleGetterStore>(
          (i) => GetDirectionAngleGetterStore(
            logic: i<GetDirectionAngle>(),
          ),
          export: true,
        ),
        Bind.singleton<ResetRefAngleGetterStore>(
          (i) => ResetRefAngleGetterStore(
            logic: i<ResetRefAngle>(),
          ),
          export: true,
        ),
        Bind.singleton<SetReferenceAngleGetterStore>(
          (i) => SetReferenceAngleGetterStore(logic: i<SetReferenceAngle>()),
          export: true,
        ),
        Bind.singleton<GetDirectionAngleStore>(
          (i) => GetDirectionAngleStore(
            getterStore: i<GetDirectionAngleGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<SetReferenceAngleStore>(
          (i) => SetReferenceAngleStore(
            getterStore: i<SetReferenceAngleGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<ResetRefAngleStore>(
          (i) => ResetRefAngleStore(
            getterStore: i<ResetRefAngleGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<QuadrantAPI>(
          (i) => QuadrantAPI(
            resetRefAngle: i<ResetRefAngleStore>(),
            angleFeedStore: i<GetDirectionAngleStore>(),
            setRefAngleStore: i<SetReferenceAngleStore>(),
          ),
          export: true,
        ),
        Bind.singleton<PortalAPI>(
          (i) => PortalAPI(
            quadrantAPI: i<QuadrantAPI>(),
          ),
          export: true,
        ),
      ];
}
