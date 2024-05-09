import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:nokhte_backend/edge_functions/add_user_metadata.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserMetadataRemoteSource {
  Future<FunctionResponse> addUserMetadata();
}

class UserMetadataRemoteSourceImpl implements UserMetadataRemoteSource {
  final SupabaseClient supabase;
  final AddUserMetadata addUserMetadataLogic;
  UserMetadataRemoteSourceImpl({required this.supabase})
      : addUserMetadataLogic = AddUserMetadata(supabase: supabase);

  @override
  addUserMetadata() async {
    final subscriberId = (await Glassfy.permissions()).subscriberId ?? '';
    return await addUserMetadataLogic.invoke(subscriberId: subscriberId);
  }
}
