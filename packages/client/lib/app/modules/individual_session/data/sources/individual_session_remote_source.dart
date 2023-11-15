import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/types/types.dart';
import 'package:nokhte_backend/p2p_perspectives_tracking.dart';
import 'package:nokhte_backend/individual_sessions.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

abstract class IndividualSessionRemoteSource {
  Future<List> getCurrentPerspectives();
  Future<List> createIndividualSession();
  Future<List> updateSessionMetadata(UpdateSessionMetadataParams params);
  Future<void> uploadIndividualPerspectivesAudio(
      UploadIndividualPerspectivesAudioParams params);
  Future<Either<Void, File>> changePerspectivesAudioRecordingStatus(
      ChangePerspectivesAudioRecordingStatusParams params);
}

class IndividualSessionRemoteSourceImpl
    implements IndividualSessionRemoteSource {
  final SupabaseClient supabase;
  final P2PPerspectivesTrackingQueries perpsectivesQueries;
  final IndividualSessionsQueries sessionQueries;
  final PerspectivesAudioStorageQueries storageQueries;
  final record = AudioRecorder();

  IndividualSessionRemoteSourceImpl({
    required this.supabase,
  })  : perpsectivesQueries =
            P2PPerspectivesTrackingQueries(supabase: supabase),
        sessionQueries = IndividualSessionsQueries(supabase: supabase),
        storageQueries = PerspectivesAudioStorageQueries(supabase: supabase);

  @override
  Future<List> getCurrentPerspectives() async => [
        await perpsectivesQueries.selectPerspectivesRow(),
        perpsectivesQueries.collaboratorInfo.theUsersUID,
      ];

  @override
  Future<List> createIndividualSession() async =>
      await sessionQueries.createNewSession();

  @override
  Future<List> updateSessionMetadata(
          UpdateSessionMetadataParams params) async =>
      await sessionQueries.updateSessionMetadata(
        newMetadata: params.sessionMetadata.toJson(),
      );

  @override
  Future<void> uploadIndividualPerspectivesAudio(
          UploadIndividualPerspectivesAudioParams params) async =>
      storageQueries.uploadPerspective(params.clipData);

  @override
  Future<Either<Void, File>> changePerspectivesAudioRecordingStatus(
      ChangePerspectivesAudioRecordingStatusParams params) async {
    switch (params.recordingAction) {
      case PerspectivesAudioRecordingActions.startRecording:
        final realPath =
            "${(await getTemporaryDirectory()).path}/${params.thePath}";
        await record.start(
          const RecordConfig(encoder: AudioEncoder.wav),
          path: realPath,
        );
        return Left(Void());
      case PerspectivesAudioRecordingActions.stopRecording:
        final path = await record.stop();
        final file = File(path as String);
        return Right(file);
    }
  }
}
