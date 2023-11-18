import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

class TimerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<TimerRemoteSourceImpl>(
          (i) => TimerRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<TimerContractImpl>(
          (i) => TimerContractImpl(
            networkInfo: i<NetworkInfoImpl>(),
            remoteSource: i<TimerRemoteSource>(),
          ),
          export: true,
        ),
        Bind.singleton<CreateTimer>(
          (i) => CreateTimer(
            contract: i<TimerContract>(),
          ),
        ),
        Bind.singleton<DeleteTheTimer>(
          (i) => DeleteTheTimer(
            contract: i<TimerContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetTimerInformationStream>(
          (i) => GetTimerInformationStream(
            contract: i<TimerContract>(),
          ),
          export: true,
        ),
        Bind.singleton<MarkdownTheTimer>(
          (i) => MarkdownTheTimer(
            contract: i<TimerContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdatePresence>(
          (i) => UpdatePresence(
            contract: i<TimerContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateTimerRunningStatus>(
          (i) => UpdateTimerRunningStatus(
            contract: i<TimerContract>(),
          ),
          export: true,
        ),
        Bind.singleton<CreateTimerGetterStore>(
          (i) => CreateTimerGetterStore(
            logic: i<CreateTimer>(),
          ),
        ),
        Bind.singleton<DeleteTheTimerGetterStore>(
          (i) => DeleteTheTimerGetterStore(
            logic: i<DeleteTheTimer>(),
          ),
          export: true,
        ),
        Bind.singleton<GetTimerInformationStreamGetterStore>(
          (i) => GetTimerInformationStreamGetterStore(
              logic: i<GetTimerInformationStream>()),
          export: true,
        ),
        Bind.singleton<MarkdownTheTimerGetterStore>(
          (i) => MarkdownTheTimerGetterStore(
            logic: i<MarkdownTheTimer>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdatePresenceGetterStore>(
          (i) => UpdatePresenceGetterStore(
            logic: i<UpdatePresence>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateTimerRunningStatusGetterStore>(
          (i) => UpdateTimerRunningStatusGetterStore(
            logic: i<UpdateTimerRunningStatus>(),
          ),
          export: true,
        ),
        Bind.singleton<CreateTimerStore>(
          (i) => CreateTimerStore(
            getterStore: i<CreateTimerGetterStore>(),
          ),
        ),
        Bind.singleton<DeleteTheTimerStore>(
          (i) => DeleteTheTimerStore(
            getterStore: i<DeleteTheTimerGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<GetTimerInformationStreamStore>(
          (i) => GetTimerInformationStreamStore(
            getterStore: i<GetTimerInformationStreamGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<MarkdownTheTimerStore>(
          (i) => MarkdownTheTimerStore(
            getterStore: i<MarkdownTheTimerGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdatePresenceStore>(
          (i) => UpdatePresenceStore(
            getterStore: i<UpdatePresenceGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateTimerRunningStatusStore>(
          (i) => UpdateTimerRunningStatusStore(
            getterStore: i<UpdateTimerRunningStatusGetterStore>(),
          ),
          export: true,
        ),
      ];
}
