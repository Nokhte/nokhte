import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/data/data.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/domain/domain.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetCurrentPerspectivesModule extends Module {
  @override
  List<Module> get imports => [GyroscopicModule()];

  @override
  List<Bind> get binds => [
        Bind.singleton<GetCurrentPerspectivesRemoteSourceImpl>(
          (i) => GetCurrentPerspectivesRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCurrentPerspectivesContractImpl>(
          (i) => GetCurrentPerspectivesContractImpl(
              remoteSource: i<GetCurrentPerspectivesRemoteSource>(),
              networkInfo: Modular.get<NetworkInfoImpl>()),
          export: true,
        ),
        Bind.singleton<GetCurrentPerspectives>(
          (i) => GetCurrentPerspectives(
              contract: i<GetCurrentPerspectivesContract>()),
          export: true,
        ),
        Bind.singleton<GetCurrentPerspectivesStore>(
          (i) => GetCurrentPerspectivesStore(
            logic: i<GetCurrentPerspectives>(),
          ),
          export: true,
        ),
      ];
}
