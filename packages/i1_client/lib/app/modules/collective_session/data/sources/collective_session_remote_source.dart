import 'dart:io';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/types/types.dart';
import 'package:nokhte_backend/tables/collective_sessions.dart';
import 'package:nokhte_backend/tables/individual_sessions.dart';
import 'package:nokhte_backend/tables/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CollectiveSessionRemoteSource {
  Future<void> moveIndividualPerspectivesAudioToCollectiveSpace(
      NoParams params);
  Future<PathsAndSessionMetadata> getCollaboratorsPerspectives(NoParams params);
  Future<List> createCollectiveSession(NoParams params);
  Future<void> addIndividualSessionMetadataToCollectiveSession();
}

class CollectiveSessionRemoteSourceImpl
    implements CollectiveSessionRemoteSource {
  final SupabaseClient supabase;
  final PerspectivesAudioStorageQueries storageQueries;
  final IndividualSessionsQueries individualSessionsQueries;
  final P2PPerspectivesTrackingQueries perspectivesQueries;
  final CollectiveSessionQueries collectiveQueries;
  CollectiveSessionRemoteSourceImpl({required this.supabase})
      : storageQueries = PerspectivesAudioStorageQueries(supabase: supabase),
        collectiveQueries = CollectiveSessionQueries(supabase: supabase),
        individualSessionsQueries =
            IndividualSessionsQueries(supabase: supabase),
        perspectivesQueries =
            P2PPerspectivesTrackingQueries(supabase: supabase);

  @override
  Future<void> moveIndividualPerspectivesAudioToCollectiveSpace(
      NoParams params) async {
    final extrapolationInfo = await _getExtrapolationInfo();
    await storageQueries.moveToCollectiveSpace(extrapolationInfo);
  }

  @override
  Future<PathsAndSessionMetadata> getCollaboratorsPerspectives(
      NoParams params) async {
    final List<FullAndRelativePath> fullAndRelativePaths =
        await _downloadTheCollaboratorsPerspectivesClips(params);
    final List sessionMetadata =
        await _getCollaboratorsIndividualSessionMetadata();
    return PathsAndSessionMetadata(
        fullAndRelativePaths: fullAndRelativePaths,
        individualSessionMetadata: sessionMetadata);
  }

  @override
  Future<void> addIndividualSessionMetadataToCollectiveSession() async {
    final res = await individualSessionsQueries.getLatestSessionInfo();
    final individualSessionTimestamp =
        DateTime.parse(res.first[IndividualSessionsQueries.sessionHeldAt]);
    final sessionMetadata =
        res.first[IndividualSessionsQueries.sessionMetadata];
    await collectiveQueries.updateTheirIndividualSessionFields(
      individualSessionTimestampParam: individualSessionTimestamp,
      sessionMetadata: sessionMetadata,
    );
  }

  @override
  Future<List> createCollectiveSession(NoParams params) async =>
      await collectiveQueries.createNewSession();

  Future<CollectiveSessionAudioExtrapolationInfo>
      _getExtrapolationInfo() async {
    final perspectiveCommitTimestamp = DateTime.parse(
        (await perspectivesQueries.selectPerspectivesRow())
            .first[P2PPerspectivesTrackingQueries.currentCommittedAt]);

    final collaboratorsIndividualSessionMetadata = {
      "metadata": (await _getCollaboratorsIndividualSessionMetadata())
    };
    final mostRecentRow = await collectiveQueries.getMostRecentRow();

    final collectiveSessionTimestamp =
        DateTime.parse(mostRecentRow.first[CollectiveSessionQueries.startedAt]);
    DateTime individualSessionTimestamp;

    individualSessionTimestamp = DateTime.parse(
        (await individualSessionsQueries.getLatestSessionInfo())
            .first[IndividualSessionsQueries.sessionHeldAt]);

    return CollectiveSessionAudioExtrapolationInfo(
      perspectivesCommitTimestamp: perspectiveCommitTimestamp,
      collectiveSessionTimestamp: collectiveSessionTimestamp,
      individualSessionMetadata: collaboratorsIndividualSessionMetadata,
      individualSessionTimestamp: individualSessionTimestamp,
    );
  }

  Future<List<FullAndRelativePath>> _downloadTheCollaboratorsPerspectivesClips(
      NoParams params) async {
    final List<FullAndRelativePath> fullAndRelativePathsList = [];
    final res = await _getExtrapolationInfo();
    final pathsAndBytes =
        await storageQueries.downloadTheCollaboratorsAudioClips(res);
    for (final pathAndBytes in pathsAndBytes) {
      final pathList = pathAndBytes.path.split('/');
      final tempDir = (await getTemporaryDirectory()).path;
      final theFolder = pathList.sublist(0, pathList.length - 1).join('/');
      await Directory("$tempDir/$theFolder").create(recursive: true);
      final fullPath = "$tempDir/${pathAndBytes.path}";
      final file = File(fullPath);
      fullAndRelativePathsList.add(
          FullAndRelativePath(relativePath: file.path, fullPath: fullPath));
      await file.writeAsBytes(pathAndBytes.rawBytes);
    }
    return fullAndRelativePathsList;
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
