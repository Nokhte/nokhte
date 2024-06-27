import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

mixin ChooseGreeterType {
  SessionMetadataStore get sessionMetadata;
  String chooseGreeterType(String elseReturnPath) {
    if (sessionMetadata.presetType == PresetTypes.collaborative) {
      return SessionConstants.collaborationGreeter;
    } else {
      return elseReturnPath;
    }
  }
}
