import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
export './choose_greeter_type.dart';
export './session_router.dart';

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
