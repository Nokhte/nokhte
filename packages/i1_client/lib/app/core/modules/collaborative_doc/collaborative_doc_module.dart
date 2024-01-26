import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/data/data.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaborativeDocModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<CollaborativeDocRemoteSourceImpl>(
          (i) => CollaborativeDocRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<CollaborativeDocContractImpl>(
          (i) => CollaborativeDocContractImpl(
            networkInfo: i<NetworkInfo>(),
            remoteSource: i<CollaborativeDocRemoteSourceImpl>(),
          ),
          export: true,
        ),
        Bind.singleton<CreateCollaborativeDoc>(
          (i) => CreateCollaborativeDoc(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaborativeDocContent>(
          (i) => GetCollaborativeDocContent(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorDocInfo>(
          (i) => GetCollaboratorDocInfo(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<MoveToFinishedDocs>(
          (i) => MoveToFinishedDocs(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateCommitDesireStatus>(
          (i) => UpdateCommitDesireStatus(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateCollaborativeDoc>(
          (i) => UpdateCollaborativeDoc(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateUserDelta>(
          (i) => UpdateUserDelta(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateUserPresence>(
          (i) => UpdateUserPresence(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaborativeDocContentStore>(
          (i) => GetCollaborativeDocContentStore(
            logic: i<GetCollaborativeDocContent>(),
          ),
          export: true,
        ),
        Bind.singleton<CollaborativeDocCoordinator>(
          (i) => CollaborativeDocCoordinator(
            moveToFinishedDocs: i<MoveToFinishedDocs>(),
            updateCommitDesire: i<UpdateCommitDesireStatus>(),
            updateDoc: i<UpdateCollaborativeDoc>(),
            createDoc: i<CreateCollaborativeDoc>(),
            getContent: i<GetCollaborativeDocContentStore>(),
            getCollaboratorInfo: i<GetCollaboratorDocInfo>(),
            updateDelta: i<UpdateUserDelta>(),
            updatePresence: i<UpdateUserPresence>(),
          ),
          export: true,
        )
      ];
}
