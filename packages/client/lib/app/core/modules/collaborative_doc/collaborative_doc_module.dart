import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:primala_backend/working_collaborative_p2p_purpose_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaborativeDocModule extends Module {
  @override
  List<Bind> get binds => [
        // & Remotes Source
        // # Collaborative Doc
        Bind.singleton<P2PPurposeSessionCollaborativeDocRemoteSourceImpl>(
          (i) => P2PPurposeSessionCollaborativeDocRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
            streams: WorkingCollaborativeP2PPurposeDocumentsStreams(
              supabase: Modular.get<SupabaseClient>(),
            ),
          ),
          export: true,
        ),
        // & Contract Implementation

        // # Collaborative Doc
        Bind.singleton<P2PPurposeSessionCollaborativeDocContractImpl>(
          (i) => P2PPurposeSessionCollaborativeDocContractImpl(
            networkInfo: i<NetworkInfo>(),
            remoteSource:
                i<P2PPurposeSessionCollaborativeDocRemoteSourceImpl>(),
          ),
          export: true,
        ),
        // & Logic
        // # Collaborative Doc
        Bind.singleton<GetCollaborativeDocContent>(
          (i) => GetCollaborativeDocContent(
            contract: i<P2PPurposeSessionCollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorDelta>(
          (i) => GetCollaboratorDelta(
            contract: i<P2PPurposeSessionCollaborativeDocContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetCollaboratorPresence>(
          (i) => GetCollaboratorPresence(
            contract: i<P2PPurposeSessionCollaborativeDocContract>(),
          ),
          export: true,
        ),
        // & MobX Getter Stores
        // # Collaborative Doc
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
        // & Mobx Logic Stores
        // # Collaborative Doc
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
      ];
}
