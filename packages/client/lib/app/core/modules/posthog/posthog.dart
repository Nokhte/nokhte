import 'package:nokhte/app/core/modules/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'posthog.dart';
export 'constants/constants.dart';
export 'data/data.dart';
export 'domain/domain.dart';

class PosthogModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
      ];
  @override
  exportedBinds(i) {
    i.add<PosthogRemoteSourceImpl>(
      () => PosthogRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<PosthogContractImpl>(
      () => PosthogContractImpl(
        remoteSource: i<PosthogRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<CaptureScreen>(
      () => CaptureScreen(
        contract: Modular.get<PosthogContractImpl>(),
      ),
    );
    i.add<CaptureNokhteSessionEnd>(
      () => CaptureNokhteSessionEnd(
        contract: Modular.get<PosthogContractImpl>(),
      ),
    );
    i.add<CaptureNokhteSessionStart>(
      () => CaptureNokhteSessionStart(
        contract: Modular.get<PosthogContractImpl>(),
      ),
    );
    i.add<CaptureShareNokhteSessionInvitation>(
      () => CaptureShareNokhteSessionInvitation(
        contract: Modular.get<PosthogContractImpl>(),
      ),
    );
    i.add<IdentifyUser>(
      () => IdentifyUser(
        contract: Modular.get<PosthogContractImpl>(),
      ),
    );
  }
}
