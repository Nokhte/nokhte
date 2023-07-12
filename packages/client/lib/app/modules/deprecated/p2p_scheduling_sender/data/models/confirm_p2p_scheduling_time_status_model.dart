import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/confirm_p2p_scheduling_time_status_entity.dart';

class ConfirmP2PSchedulingTimeStatusModel
    extends ConfirmP2PSchedulingTimeStatusEntity {
  const ConfirmP2PSchedulingTimeStatusModel({required super.isSent});

  static ConfirmP2PSchedulingTimeStatusModel fromSupabase(
      List<dynamic> supabaseQueryRes) {
    const successCase = ConfirmP2PSchedulingTimeStatusModel(isSent: true);
    const notSuccessCase = ConfirmP2PSchedulingTimeStatusModel(isSent: false);

    if (supabaseQueryRes.isEmpty) return notSuccessCase;

    return supabaseQueryRes[0]["time_is_agreed_upon"] == true
        ? successCase
        : notSuccessCase;
  }
}
