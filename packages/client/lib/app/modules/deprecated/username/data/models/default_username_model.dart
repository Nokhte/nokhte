import 'package:primala/app/modules/deprecated/username/domain/entities/default_username_entity.dart';
import 'package:primala/app/core/utilities/misc_algos.dart';

class DefaultUsernameModel extends DefaultUsernameEntity {
  const DefaultUsernameModel({required String defaultUsername})
      : super(defaultUsername: defaultUsername);

  static DefaultUsernameModel fromSupabase(String userEmail) {
    final String defaultUsername = MiscAlgos.deriveUsernameFromEmail(userEmail);
    return DefaultUsernameModel(defaultUsername: defaultUsername);
  }
}
