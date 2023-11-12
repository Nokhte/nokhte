import 'dart:io';
import 'package:nokhte/app/modules/collective_session/types/types.dart';
import 'package:nokhte_backend/collective_sessions.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollectiveSessionRemoteSource {
  Future<void> moveIndividualPerspectivesAudioToCollectiveSpace(
      CollectiveSessionAudioExtrapolationInfo params);
  Future<PathsAndSessionMetadata> getCollaboratorsPerspectives(
      CollectiveSessionAudioExtrapolationInfo params);
}

class CollectiveSessionRemoteSourceImpl
    implements CollectiveSessionRemoteSource {
  final SupabaseClient supabase;
  final PerspectivesAudioStorageQueries storageQueries;
  final CollectiveSessionQueries collectiveQueries;
  CollectiveSessionRemoteSourceImpl({required this.supabase})
      : storageQueries = PerspectivesAudioStorageQueries(supabase: supabase),
        collectiveQueries = CollectiveSessionQueries(supabase: supabase);

  @override
  Future<void> moveIndividualPerspectivesAudioToCollectiveSpace(
          CollectiveSessionAudioExtrapolationInfo params) async =>
      await storageQueries.moveToCollectiveSpace(params);

  Future<List<FullAndRelativePath>> _downloadTheCollaboratorsPerspectivesClips(
      CollectiveSessionAudioExtrapolationInfo params) async {
    final List<FullAndRelativePath> fullAndRelativePathsList = [];
    final pathsAndBytes =
        await storageQueries.downloadTheCollaboratorsAudioClips(params);
    for (final pathAndBytes in pathsAndBytes) {
      final fullPath =
          "${(await getTemporaryDirectory()).path}/${pathAndBytes.path}";
      final file = File(fullPath);
      fullAndRelativePathsList.add(
          FullAndRelativePath(relativePath: file.path, fullPath: fullPath));
      file.writeAsBytes(pathAndBytes.rawBytes);
    }
    return fullAndRelativePathsList;
  }

  @override
  Future<PathsAndSessionMetadata> getCollaboratorsPerspectives(
      CollectiveSessionAudioExtrapolationInfo params) async {
    final List<FullAndRelativePath> fullAndRelativePaths =
        await _downloadTheCollaboratorsPerspectivesClips(params);
    final List sessionMetadata =
        await _getCollaboratorsIndividualSessionMetadata();
    return PathsAndSessionMetadata(
        fullAndRelativePaths: fullAndRelativePaths,
        individualSessionMetadata: sessionMetadata);
  }

  Future<List> _getCollaboratorsIndividualSessionMetadata() async {
    final res = await collectiveQueries.getCollaboratorsSessionMetadata();
    final theCollaboratorsNumber =
        collectiveQueries.collaboratorInfo.theCollaboratorsNumber;
    const individualSessionMetadata =
        CollectiveSessionQueries.individualSessionMetadata;
    final theCollaboratorsMetadata =
        res.first["${theCollaboratorsNumber}_$individualSessionMetadata"]
            ["metadata"];
    return theCollaboratorsMetadata;
  }
}
