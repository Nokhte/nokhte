import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
import 'package:nokhte/app/modules/storage/storage_logic_module.dart';
import 'presentation/presentation.dart';
import 'storage_widgets_module.dart';

class StorageModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        StorageWidgetsModule(),
        PosthogModule(),
        UserInformationModule(),
        SupabaseModule(),
        StorageLogicModule(),
      ];
  @override
  void binds(i) {
    i.add<StorageHomeCoordinator>(
      () => StorageHomeCoordinator(
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        updateSessionAliasLogic: Modular.get<UpdateSessionAlias>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<StorageHomeWidgetsCoordinator>(),
        swipe: SwipeDetector(),
        userInfo: Modular.get<UserInformationCoordinator>(),
      ),
    );
    i.add<StorageContentCoordinator>(() => StorageContentCoordinator(
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<StorageContentWidgetsCoordinator>(),
          swipe: SwipeDetector(),
          getUserInfo: Modular.get<GetUserInfoStore>(),
        ));
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => StorageHomeScreen(
        coordinator: Modular.get<StorageHomeCoordinator>(),
      ),
    );
    r.child(
      '/content',
      transition: TransitionType.noTransition,
      child: (context) => StorageContentScreen(
        coordinator: Modular.get<StorageContentCoordinator>(),
      ),
    );
  }
}
