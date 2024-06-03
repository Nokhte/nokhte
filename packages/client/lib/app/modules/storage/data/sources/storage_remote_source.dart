import 'package:nokhte/app/modules/storage/storage.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_information.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class StorageRemoteSource {
  Future<List> getNokhteSessionArtifacts();
  Future<List> getCollaboratorRows();
  Future<List> updateSessionAlias(UpdateSessionAliasParams params);
  String getUserUID();
}

class StorageRemoteSourceImpl implements StorageRemoteSource {
  final SupabaseClient supabase;
  final FinishedNokhteSessionQueries finishedNokhteSessionQueries;
  final UserInformationQueries userNamesQueries;
  StorageRemoteSourceImpl({required this.supabase})
      : finishedNokhteSessionQueries =
            FinishedNokhteSessionQueries(supabase: supabase),
        userNamesQueries = UserInformationQueries(supabase: supabase);

  @override
  getNokhteSessionArtifacts() async =>
      await finishedNokhteSessionQueries.select();

  @override
  getCollaboratorRows() async => await userNamesQueries.getCollaboratorRows();

  @override
  updateSessionAlias(UpdateSessionAliasParams params) async =>
      await finishedNokhteSessionQueries.updateAlias(
        newAlias: params.newAlias,
        sessionUID: params.sessionUID,
      );
  @override
  String getUserUID() => supabase.auth.currentUser?.id ?? '';
}
