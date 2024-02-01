import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';

abstract class BasePresenceRemoteSource<T> {
  Future<List> updateOnlineStatus(UpdatePresencePropertyParams params);
  Future<List> setUserAsCurrentTalker();
  Future<void> clearTheCurrentTalker();
  Future<List> updateCurrentPhase(double params);
  Stream<T> getSessionMetadata();
  bool cancelSessionMetadataStream();
}
