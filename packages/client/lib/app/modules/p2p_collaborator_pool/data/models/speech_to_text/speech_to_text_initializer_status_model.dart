import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class SpeechToTextInitializerStatusModel
    extends SpeechToTextInitializerStatusEntity {
  const SpeechToTextInitializerStatusModel({required bool isAllowed})
      : super(isAllowed: isAllowed);
}
