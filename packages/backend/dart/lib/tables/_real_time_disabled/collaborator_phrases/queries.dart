import 'package:supabase_flutter/supabase_flutter.dart';

class CollaboratorPhraseQueries {
  static String get tableName => 'collaborator_phrases';
  static String get uid => 'uid';
  final SupabaseClient supabase;
  String userUID;

  CollaboratorPhraseQueries({
    required this.supabase,
  }) : userUID = supabase.auth.currentUser?.id ?? "";

  Future<List> getUserInfo() async =>
      await supabase.from(tableName).select().eq(uid, userUID);

  Future<List> getCollaboratorPhraseInfo() async =>
      await supabase.from(tableName).select().eq(uid, userUID);

  Future<void> deleteCollaboratorPhraseInfo() async =>
      await supabase.from(tableName).delete().eq(uid, userUID);
}
