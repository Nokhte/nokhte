import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/scheduling/data/data.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
import 'package:nokhte/app/core/modules/scheduling/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SchedulingModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<SchedulingRemoteSourceImpl>(
          (i) => SchedulingRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<SchedulingContractImpl>(
          (i) => SchedulingContractImpl(
            remoteSource: i<SchedulingRemoteSource>(),
            networkInfo: i<NetworkInfoImpl>(),
          ),
          export: true,
        ),
        Bind.singleton<CreateSchedulingSession>(
          (i) => CreateSchedulingSession(
            contract: i<SchedulingContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorsDateAndTime>(
          (i) => GetCollaboratorsDateAndTime(
            contract: i<SchedulingContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateSchedulingTimeOrDate>(
          (i) => UpdateSchedulingTimeOrDate(
            contract: i<SchedulingContract>(),
          ),
          export: true,
        ),
        Bind.singleton<CreateSchedulingSessionStore>(
          (i) => CreateSchedulingSessionStore(
            logic: i<CreateSchedulingSession>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorsDateAndTimeStore>(
          (i) => GetCollaboratorsDateAndTimeStore(
            logic: i<GetCollaboratorsDateAndTime>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateSchedulingTimeOrDateStore>(
          (i) => UpdateSchedulingTimeOrDateStore(
            logic: i<UpdateSchedulingTimeOrDate>(),
          ),
          export: true,
        ),
        Bind.singleton<SchedulingCoordinatorStore>(
          (i) => SchedulingCoordinatorStore(
            createSchedulingSessionStore: i<CreateSchedulingSessionStore>(),
            getCollaboratorsDateAndTimeStore:
                i<GetCollaboratorsDateAndTimeStore>(),
            updateSchedulingTimeOrDateStore:
                i<UpdateSchedulingTimeOrDateStore>(),
          ),
          export: true,
        ),
      ];
}
