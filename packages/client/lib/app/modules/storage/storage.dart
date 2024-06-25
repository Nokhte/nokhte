import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/supabase/supabase.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'storage.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';
export 'constants/constants.dart';
export 'storage_logic_module.dart';
export 'storage_widgets_module.dart';

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
        tap: TapDetector(),
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        updateSessionAliasLogic: Modular.get<UpdateSessionAlias>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<StorageHomeWidgetsCoordinator>(),
        swipe: SwipeDetector(),
        userInfo: Modular.get<UserInformationCoordinator>(),
      ),
    );
    i.add<StorageContentCoordinator>(() => StorageContentCoordinator(
          tap: TapDetector(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<StorageContentWidgetsCoordinator>(),
          swipe: SwipeDetector(),
          getUserInfo: Modular.get<GetUserInfoStore>(),
        ));
  }

  @override
  void routes(r) {
    r.child(
      StorageConstants.relativeRoot,
      transition: TransitionType.noTransition,
      child: (context) => StorageHomeScreen(
        coordinator: Modular.get<StorageHomeCoordinator>(),
      ),
    );
    r.child(
      StorageConstants.relativeContent,
      transition: TransitionType.noTransition,
      child: (context) => StorageContentScreen(
        coordinator: Modular.get<StorageContentCoordinator>(),
      ),
    );
  }
}
