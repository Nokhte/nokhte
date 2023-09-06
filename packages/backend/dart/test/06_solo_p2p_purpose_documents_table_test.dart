// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:primala_backend/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/solo_p2p_purpose_documents.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
  });

  tearDownAll(() async {
    await supabaseAdmin.from('solo_p2p_purpose_documents').delete().eq(
          'owner_uid',
          firstUserUID,
        );
  });

  test("STEP 1: Document is Created & Not Shared", () async {
    // arrange
    await SignIn.user1(supabase: supabase);
    // act
    final res = await SoloP2PPurposeDocuments.createSoloDoc(
      supabase: supabase,
      ownerUID: firstUserUID,
      collaboratorUID: secondUserUID,
    );
    // asserts from user 1 perspective
    expect(res[0]["owner_uid"], firstUserUID);
    expect(res[0]["collaborator_uid"], secondUserUID);
    expect(res[0]["is_visible_to_collaborator"], false);
    expect(res[0]["session_is_completed"], false);
    // asserts from user 2 perspective
    await SignIn.user2(supabase: supabase);
    final secondRes = await SoloP2PPurposeDocuments.fetchDocInfo(
      supabase: supabase,
      collaboratorUID: secondUserUID,
    );
    expect(secondRes, isEmpty);
  });

  test(
    "STEP 2: Document is Then Shared, should have proper permissioning",
    () async {
      await SignIn.user1(supabase: supabase);
      print('${supabase.auth.currentUser?.id == firstUserUID}');
      await SoloP2PPurposeDocuments.updateDocContent(
        supabase: supabase,
        ownerUID: firstUserUID,
        content: 'hi there collaborator 2',
      );
      await SoloP2PPurposeDocuments.updateDocVisibility(
        supabase: supabase,
        ownerUID: firstUserUID,
        visibility: true,
      );
      await SignIn.user2(supabase: supabase);
      final thirdRes = await SoloP2PPurposeDocuments.fetchDocInfo(
        supabase: supabase,
        collaboratorUID: secondUserUID,
      );
      print(thirdRes);
      expect(thirdRes[0]["content"], "hi there collaborator 2");
    },
  );

  test(
    "STEP 3: Session is ended & visibility is dealt with accordingly",
    () async {
      await SignIn.user1(supabase: supabase);
      await SoloP2PPurposeDocuments.sealDocument(
        supabase: supabase,
        ownerUID: firstUserUID,
      );
      await SignIn.user2(supabase: supabase);
      final fourthRes = await SoloP2PPurposeDocuments.fetchDocInfo(
        supabase: supabase,
        collaboratorUID: secondUserUID,
      );
      expect(fourthRes, isEmpty);
    },
  );
}
