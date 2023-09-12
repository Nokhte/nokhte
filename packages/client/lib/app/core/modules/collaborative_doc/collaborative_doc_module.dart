import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:primala_backend/working_collaborative_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaborativeDocModule extends Module {
  @override
  List<Bind> get binds => [
        // & Remotes Source
        Bind.singleton<CollaborativeDocRemoteSourceImpl>(
          (i) => CollaborativeDocRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
            queries: WorkingCollaborativeDocumentsQueries(
              supabase: Modular.get<SupabaseClient>(),
            ),
            streams: WorkingCollaborativeDocumentsStreams(
              supabase: Modular.get<SupabaseClient>(),
            ),
          ),
          export: true,
        ),
        // & Contract Implementation
        Bind.singleton<CollaborativeDocContractImpl>(
          (i) => CollaborativeDocContractImpl(
            networkInfo: i<NetworkInfo>(),
            remoteSource: i<CollaborativeDocRemoteSourceImpl>(),
          ),
          export: true,
        ),
        // & Logic
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
        Bind.singleton<GetCollaboratorDelta>(
          (i) => GetCollaboratorDelta(
            contract: i<CollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorPresence>(
          (i) => GetCollaboratorPresence(
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

        // & MobX Getter Stores
        Bind.singleton<CreateCollaborativeDocGetterStore>(
          (i) => CreateCollaborativeDocGetterStore(
            logic: i<CreateCollaborativeDoc>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaborativeDocContentGetterStore>(
          (i) => GetCollaborativeDocContentGetterStore(
            logic: i<GetCollaborativeDocContent>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorDeltaGetterStore>(
          (i) => GetCollaboratorDeltaGetterStore(
            logic: i<GetCollaboratorDelta>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorPresenceGetterStore>(
          (i) => GetCollaboratorPresenceGetterStore(
            logic: i<GetCollaboratorPresence>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateCollaborativeDocGetterStore>(
          (i) => UpdateCollaborativeDocGetterStore(
            logic: i<UpdateCollaborativeDoc>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateUserDeltaGetterStore>(
          (i) => UpdateUserDeltaGetterStore(
            logic: i<UpdateUserDelta>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateUserPresenceGetterStore>(
          (i) => UpdateUserPresenceGetterStore(
            logic: i<UpdateUserPresence>(),
          ),
          export: true,
        ),
        // & Mobx Logic Stores
        Bind.singleton<CreateCollaborativeDocStore>(
          (i) => CreateCollaborativeDocStore(
            getterStore: i<CreateCollaborativeDocGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaborativeDocContentStore>(
          (i) => GetCollaborativeDocContentStore(
            getterStore: i<GetCollaborativeDocContentGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorDeltaStore>(
          (i) => GetCollaboratorDeltaStore(
            getterStore: i<GetCollaboratorDeltaGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorPresenceStore>(
          (i) => GetCollaboratorPresenceStore(
            getterStore: i<GetCollaboratorPresenceGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateCollaborativeDocStore>(
          (i) => UpdateCollaborativeDocStore(
            getterStore: i<UpdateCollaborativeDocGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateUserDeltaStore>(
          (i) => UpdateUserDeltaStore(
            getterStore: i<UpdateUserDeltaGetterStore>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateUserPresenceStore>(
          (i) => UpdateUserPresenceStore(
            getterStore: i<UpdateUserPresenceGetterStore>(),
          ),
          export: true,
        ),
        // & Mobx Coordinator Stores
        Bind.singleton<CollaborativeDocCoordinatorStore>(
          (i) => CollaborativeDocCoordinatorStore(
            updateDoc: i<UpdateCollaborativeDocStore>(),
            createDoc: i<CreateCollaborativeDocStore>(),
            getContent: i<GetCollaborativeDocContentStore>(),
            getDelta: i<GetCollaboratorDeltaStore>(),
            getPresence: i<GetCollaboratorPresenceStore>(),
            updateDelta: i<UpdateUserDeltaStore>(),
            updatePresence: i<UpdateUserPresenceStore>(),
          ),
          export: true,
        )
      ];
}
