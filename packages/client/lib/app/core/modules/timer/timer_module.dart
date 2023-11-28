import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'mobx/mobx.dart';

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
          export: true,
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
        Bind.singleton<MarkTimerAsComplete>(
          (i) => MarkTimerAsComplete(
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
        Bind.singleton<GetTimerInformationStreamStore>(
          (i) => GetTimerInformationStreamStore(
            logic: i<GetTimerInformationStream>(),
          ),
          export: true,
        ),
        Bind.factory<TimerCoordinator>(
          (i) => TimerCoordinator(
            createTimer: i<CreateTimer>(),
            deleteTheTimer: i<DeleteTheTimer>(),
            getTimeInfoStream: i<GetTimerInformationStreamStore>(),
            markTimerAsComplete: i<MarkTimerAsComplete>(),
            updatePresence: i<UpdatePresence>(),
            updateTimerRunningStatus: i<UpdateTimerRunningStatus>(),
          ),
          export: true,
        ),
      ];
}
