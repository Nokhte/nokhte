// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/tables/solo_sharable_documents.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    final userIdResults = await UserSetupConstants.getUIDs();
    firstUserUID = userIdResults.first;
    secondUserUID = userIdResults[1];
  });

  tearDownAll(() async {
    await supabaseAdmin.from('solo_sharable_documents').delete().eq(
          'owner_uid',
          firstUserUID,
        );
  });

  test("STEP 1: Document is Created & Not Shared", () async {
    await SignIn.user1(supabase: supabase);
    final res = await SoloSharableDocuments.createSoloDoc(
      supabase: supabase,
      ownerUID: firstUserUID,
      collaboratorUID: secondUserUID,
      docType: 'purpose',
    );

    expect(res.first["owner_uid"], firstUserUID);
    expect(res.first["collaborator_uid"], secondUserUID);
    expect(res.first["is_visible_to_collaborator"], false);
    expect(res.first["session_is_completed"], false);

    await SignIn.user2(supabase: supabase);
    final secondRes = await SoloSharableDocuments.getDocInfo(
      supabase: supabase,
      collaboratorUID: secondUserUID,
    );
    expect(secondRes, isEmpty);
  });

  test(
    "STEP 2: Document is Then Shared, should have proper permissioning",
    () async {
      await SignIn.user1(supabase: supabase);
      await SoloSharableDocuments.updateDocContent(
        supabase: supabase,
        ownerUID: firstUserUID,
        content: 'hi there collaborator 2',
      );
      await SoloSharableDocuments.updateDocVisibility(
        supabase: supabase,
        ownerUID: firstUserUID,
        visibility: true,
      );
      await SignIn.user2(supabase: supabase);
      final thirdRes = await SoloSharableDocuments.getDocInfo(
        supabase: supabase,
        collaboratorUID: secondUserUID,
      );
      expect(thirdRes.first["content"], "hi there collaborator 2");
    },
  );

  test(
    "STEP 3: Session is ended & visibility is dealt with accordingly",
    () async {
      await SignIn.user1(supabase: supabase);
      await SoloSharableDocuments.sealDocument(
        supabase: supabase,
        ownerUID: firstUserUID,
      );
      await SignIn.user2(supabase: supabase);
      final fourthRes = await SoloSharableDocuments.getDocInfo(
        supabase: supabase,
        collaboratorUID: secondUserUID,
      );
      expect(fourthRes, isEmpty);
    },
  );
}
