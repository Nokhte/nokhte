import 'package:primala/app/core/modules/gyroscopic/data/data.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/mobx/main/get_direction_angle_store.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';

///   * Presentation Layer Imports
//          * MobX
//          * Views
// * 3rd Parties
import 'package:flutter_modular/flutter_modular.dart';
//    * Core Imports
import 'package:primala/app/core/network/network_info.dart';
//          * Guard Import
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
// & MobX Getter Stores
        Bind.singleton<GetDirectionAngleGetterStore>(
          (i) => GetDirectionAngleGetterStore(
            logic: i<GetDirectionAngle>(),
          ),
          export: true,
        ),
// & Mobx Mother Stores
        Bind.singleton<GetDirectionAngleStore>(
          (i) => GetDirectionAngleStore(
            getterStore: i<GetDirectionAngleGetterStore>(),
          ),
          export: true,
        ),
      ];
}
