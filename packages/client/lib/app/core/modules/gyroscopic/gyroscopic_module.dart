import 'package:primala/app/core/modules/gyroscopic/data/data.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
// * 3rd Parties
import 'package:flutter_modular/flutter_modular.dart';
//    * Core Imports
import 'package:primala/app/core/network/network_info.dart';
// ***************************************************

class GyroscopicModule extends Module {
  @override
  List<Bind> get binds => [
        // & Data Source
        Bind.singleton<GyroscopicRemoteSourceImpl>(
          (i) => GyroscopicRemoteSourceImpl(),
          export: true,
        ),
        // & Contract Implementation
        Bind.singleton<GyroscopicContractImpl>(
          (i) => GyroscopicContractImpl(
            networkInfo: Modular.get<NetworkInfoImpl>(),
            remoteSource: i<GyroscopicRemoteSource>(),
          ),
          export: true,
        ),
        // & Logic
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
        Bind.singleton<ResetRefAngleForMaxCapacity>(
          (i) => ResetRefAngleForMaxCapacity(
            contract: i<GyroscopicContract>(),
          ),
          export: true,
        ),
        // & MobX Getter Stores
        Bind.singleton<GetDirectionAngleGetterStore>(
          (i) => GetDirectionAngleGetterStore(
            logic: i<GetDirectionAngle>(),
          ),
          export: true,
        ),
        Bind.singleton<ResetRefAngleForMaxCapacityGetterStore>(
          (i) => ResetRefAngleForMaxCapacityGetterStore(
            logic: i<ResetRefAngleForMaxCapacity>(),
          ),
          export: true,
        ),
        Bind.singleton<SetReferenceAngleGetterStore>(
          (i) => SetReferenceAngleGetterStore(logic: i<SetReferenceAngle>()),
          export: true,
        ),
        // & Mobx Mother Stores
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
        Bind.singleton<ResetRefAngleForMaxCapacityStore>(
          (i) => ResetRefAngleForMaxCapacityStore(
            getterStore: i<ResetRefAngleForMaxCapacityGetterStore>(),
          ),
          export: true,
        ),
        // & Coordinator Store
        Bind.singleton<GyroscopicCoordinatorStore>(
          (i) => GyroscopicCoordinatorStore(
            resetRefAngle: i<ResetRefAngleForMaxCapacityStore>(),
            angleFeedStore: i<GetDirectionAngleStore>(),
            setRefAngleStore: i<SetReferenceAngleStore>(),
          ),
          export: true,
        ),
      ];
}
