import 'package:primala/app/modules/username/domain/entities/default_username_entity.dart';
import 'package:primala/app/core/utilities/email_modifier_algo.dart';

class DefaultUsernameModel extends DefaultUsernameEntity {
  const DefaultUsernameModel({required String defaultUsername})
      : super(defaultUsername: defaultUsername);

  static DefaultUsernameModel fromSupabase(String userEmail) {
    final String defaultUsername = EmailModifierAlgo.call(userEmail);
    return DefaultUsernameModel(defaultUsername: defaultUsername);
  }
}
