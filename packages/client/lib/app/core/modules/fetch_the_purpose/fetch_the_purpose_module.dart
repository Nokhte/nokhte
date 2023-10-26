import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/fetch_the_purpose/data/data.dart';
import 'package:nokhte/app/core/modules/fetch_the_purpose/domain/domain.dart';
import 'package:nokhte/app/core/modules/fetch_the_purpose/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FetchThePurposeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<FetchThePurposeSourceImpl>(
          (i) => FetchThePurposeSourceImpl(
              supabase: Modular.get<SupabaseClient>()),
          export: true,
        ),
        Bind.singleton<FetchThePurposeContractImpl>(
          (i) => FetchThePurposeContractImpl(
            remoteSource: i<FetchThePurposeSourceImpl>(),
            networkInfo: i<NetworkInfo>(),
          ),
          export: true,
        ),
        Bind.singleton<FetchThePurpose>(
          (i) => FetchThePurpose(
            contract: i<FetchThePurposeContract>(),
          ),
          export: true,
        ),
        Bind.singleton<FetchThePurposeGetterStore>(
          (i) => FetchThePurposeGetterStore(
            logic: i<FetchThePurpose>(),
          ),
          export: true,
        ),
        Bind.singleton<FetchThePurposeStore>(
          (i) => FetchThePurposeStore(
            getterStore: i<FetchThePurposeGetterStore>(),
          ),
          export: true,
        ),
      ];
}
