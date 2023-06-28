import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';

class UsernameStatusModel extends UsernameStatusEntity {
  const UsernameStatusModel({required bool isCreated})
      : super(isCreated: isCreated);

  static UsernameStatusModel fromSupabase(List<dynamic> supabaseQueryRes) {
    if (supabaseQueryRes.isEmpty) {
      return const UsernameStatusModel(isCreated: false);
    } else {
      return const UsernameStatusModel(isCreated: true);
    }
  }
}
