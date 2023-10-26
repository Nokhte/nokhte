import 'package:nokhte/app/modules/home/domain/entities/name_creation_status_entity.dart';

class NameCreationStatusModel extends NameCreationStatusEntity {
  const NameCreationStatusModel({required bool isSent}) : super(isSent: isSent);

  static NameCreationStatusModel fromSupabase(List<dynamic> sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const NameCreationStatusModel(isSent: false);
    } else {
      return const NameCreationStatusModel(isSent: true);
    }
  }
}
