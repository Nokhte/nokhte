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
        data: {"status": 400, "message": "subscriberId cannot be empty"},
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
        status: 200,
        data: {"status": 200, "message": 'metadata already exists'},
      );
    }
  }
}
