import 'package:nokhte_backend/tables/_real_time_disabled/user_metadata/queries.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddUserMetadata extends UserMetadataQueries {
  AddUserMetadata({required super.supabase});

  Future<FunctionResponse> invoke({
    required String subscriberId,
  }) async {
    if (subscriberId.isEmpty) {
      return FunctionResponse(
        status: 400,
        data: 'no subscriber id provided',
      );
    }
    final checkRes = await getUserMetadata();
    if (checkRes.isEmpty) {
      return await supabase.functions.invoke(
        "add-user-metadata",
        body: {
          'userUID': userUID,
          'subscriberId': subscriberId,
        },
      );
    } else {
      return FunctionResponse(
        status: 201,
        data: 'metadata already exists',
      );
    }
  }
}
