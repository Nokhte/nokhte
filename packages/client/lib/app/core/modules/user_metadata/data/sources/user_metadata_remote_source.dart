import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:nokhte_backend/edge_functions/add_user_metadata.dart';
import 'package:nokhte_backend/tables/user_metadata.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserMetadataRemoteSource {
  Future<FunctionResponse> addUserMetadata();
  Future<List> getUserMetadata();
}

class UserMetadataRemoteSourceImpl implements UserMetadataRemoteSource {
  final SupabaseClient supabase;
  final AddUserMetadata _addUserMetadata;
  final UserMetadataQueries queries;
  UserMetadataRemoteSourceImpl({required this.supabase})
      : _addUserMetadata = AddUserMetadata(supabase: supabase),
        queries = UserMetadataQueries(supabase: supabase);

  @override
  addUserMetadata() async {
    final subscriberId = (await Glassfy.permissions()).subscriberId ?? '';
    return await _addUserMetadata.invoke(subscriberId: subscriberId);
  }

  @override
  Future<List> getUserMetadata() async => await queries.getUserMetadata();
}
