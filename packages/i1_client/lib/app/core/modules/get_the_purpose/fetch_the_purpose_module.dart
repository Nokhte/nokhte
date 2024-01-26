import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/data/data.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/domain/domain.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetThePurposeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<GetThePurposeSourceImpl>(
          (i) =>
              GetThePurposeSourceImpl(supabase: Modular.get<SupabaseClient>()),
          export: true,
        ),
        Bind.singleton<GetThePurposeContractImpl>(
          (i) => GetThePurposeContractImpl(
            remoteSource: i<GetThePurposeSourceImpl>(),
            networkInfo: i<NetworkInfo>(),
          ),
          export: true,
        ),
        Bind.singleton<GetThePurpose>(
          (i) => GetThePurpose(
            contract: i<GetThePurposeContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetThePurposeStore>(
          (i) => GetThePurposeStore(
            logic: i<GetThePurpose>(),
          ),
          export: true,
        ),
      ];
}
