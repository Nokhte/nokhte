// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/constants/general/supabase_client_constants.dart';
import 'package:primala_backend/constants/general/user_data_constants.dart';
import 'package:primala_backend/constants/p2p_requests/p2p_request_row_constants.dart';
import 'package:primala_backend/constants/general/user_setup_constants.dart';

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

  tearDown(() async {
    await supabaseAdmin
        .from('p2p_requests')
        .delete()
        .eq('sender_id', secondUserUID)
        .eq('receiver_id', firstUserUID);
  });

  group("USER 1 ACTIONS: ", () {
    setUpAll(() async {
      await supabase.auth.signInWithPassword(
        email: "test@example.com",
        password: "test123",
      );
    });

    tearDown(() async {
      await supabaseAdmin
          .from('p2p_requests')
          .delete()
          .eq('sender_id', firstUserUID)
          .eq('receiver_id', secondUserUID);
    });

    tearDownAll(() async {
      supabase.auth.signOut();
    });
    test("✅ CREATE: SHOULD be able to send a request", () async {
      // arrange
      print('first uid $firstUserUID, second uid $secondUserUID');
      await supabase.from('p2p_requests').insert(
            SupabaseP2PRequestRowConstants.firstToSecondUserRequest(
              senderUID: firstUserUID,
              receiverUID: secondUserUID,
            ).toJson(),
          );
      // act
      final res = await supabaseAdmin
          .from('p2p_requests')
          .select('request_id')
          .eq('sender_id', firstUserUID)
          .eq('receiver_id', secondUserUID);

      expect(res[0].toString(), isNot("{}"));
    });
    test("❌CREATE: Shouldn't be able to create the same request TWICE",
        () async {
      await supabase.from('p2p_requests').insert(
            SupabaseP2PRequestRowConstants.firstToSecondUserRequest(
              senderUID: firstUserUID,
              receiverUID: secondUserUID,
            ).toJson(),
          );
      try {
        final failedRes = await supabase.from('p2p_requests').insert(
              SupabaseP2PRequestRowConstants.firstToSecondUserRequest(
                senderUID: firstUserUID,
                receiverUID: secondUserUID,
              ).toJson(),
            );
        expect(failedRes, throwsException);
      } catch (e) {
        expect(e, isA<PostgrestException>());
      }
    });
    test("❌CREATE: Shouldn't be able to send a request to themselves",
        () async {
      try {
        final failedRes = await supabase.from('p2p_requests').insert(
              SupabaseP2PRequestRowConstants.firstToSecondUserRequest(
                senderUID: firstUserUID,
                receiverUID: firstUserUID,
              ).toJson(),
            );
        expect(failedRes, throwsException);
      } catch (e) {
        expect(e, isA<PostgrestException>());
      }
    });
    test(
      "✅SELECT: Should be able to read a request they've authored",
      () async {
        // arrange
        await supabase.from('p2p_requests').insert(
              SupabaseP2PRequestRowConstants.firstToSecondUserRequest(
                senderUID: firstUserUID,
                receiverUID: secondUserUID,
              ).toJson(),
            );
        // act
        final res = await supabase
            .from('p2p_requests')
            .select()
            .eq('sender_id', firstUserUID);
        print(res);
        expect(res, isNot([]));
      },
    );
    test(
      "❌UPDATE: Can't Edit Anything Once It's Sent",
      () async {
        //arrange
        await supabaseAdmin.from('p2p_requests').insert(
              SupabaseP2PRequestRowConstants.firstToSecondUserRequest(
                senderUID: secondUserUID,
                receiverUID: firstUserUID,
              ).toJson(),
            );
        // act
        try {
          final failedRes = await supabase
              .from('p2p_requests')
              .update({'receiver_id': firstUserUID});
          expect(failedRes, throwsException);
        } catch (e) {
          expect(e, isA<PostgrestException>());
        }
      },
    );

    test(
      "❌DB Function Call: Shouldn't Be Able To Directly Call Any function on the internal_function schema",
      () async {
        //arrange
        // act
        try {
          final failedRes = await supabase
              .rpc('internal_functions.enforce_unique_p2p_requests');
          expect(failedRes, throwsException);
        } catch (e) {
          expect(e, isA<PostgrestException>());
        }
      },
    );
  });

  group("USER 1 Sends Request ==THEN=> 🧪User 2 Actions", () {
    setUpAll(() async {
      await supabase.auth
          .signInWithPassword(password: 'test123', email: 'test2@example.com');
    });

    tearDown(() async {
      await supabaseAdmin
          .from('p2p_requests')
          .delete()
          .eq('sender_id', firstUserUID)
          .eq('receiver_id', secondUserUID);
    });

    setUp(() async {
      await supabaseAdmin
          .from('p2p_requests')
          .insert({"sender_id": firstUserUID, "receiver_id": secondUserUID});
    });
    test(
      "✅SELECT: Should be able to read a request they've received",
      () async {
        final res = await supabase
            .from('p2p_requests')
            .select()
            .eq("sender_id", firstUserUID)
            .eq("receiver_id", secondUserUID);
        // .eq('receiver_id', secondUserUID);
        print(res);
        expect(res, isNot([]));
      },
    );

    test(
      "✅UPDATE: Receiver Can Only Edit is_accepted and accepted at",
      () async {
        await supabase
            .from('p2p_requests')
            .update({
              'is_accepted': true,
              'responded_at': DateTime.now().toIso8601String(),
            })
            .eq('sender_id', firstUserUID)
            .eq('receiver_id', secondUserUID)
            .eq('is_accepted', false);
        // act
        final res = await supabase
            .from('p2p_requests')
            .select('is_accepted')
            .eq('sender_id', firstUserUID);
        print(res);
        //assert
        expect(res[0]['is_accepted'], true);
      },
    );
    test(
      "❌UPDATE: Receiver will fail to edit any other field",
      () async {
        // arrange
        try {
          await supabase.from('p2p_requests').update(
            {"receiver_id": UserDataConstants.user1UID},
          ).eq('sender_id', firstUserUID);
          final res = await supabase
              .from('p2p_requests')
              .select()
              .eq('receiver_id', firstUserUID);
          expect(res, throwsException);
        } catch (e) {
          expect(e, isA<PostgrestException>());
        }
      },
    );
  });

  group("USER 1 Sends Request To User 2, then User 3", () {
    setUpAll(() async {
      await supabase.auth
          .signInWithPassword(password: 'test123', email: 'test3@example.com');
    });

    tearDown(() async {
      await supabaseAdmin
          .from('p2p_requests')
          .delete()
          .eq('sender_id', firstUserUID)
          .eq('receiver_id', secondUserUID);
    });

    setUp(() async {
      await supabaseAdmin
          .from('p2p_requests')
          .insert({"sender_id": firstUserUID, "receiver_id": secondUserUID});
    });
    test(
      "❌SELECT: Shouldn't be able to read a request they have nothing to do with",
      () async {
        await supabase.auth.signOut();
        final res = await supabase
            .from('p2p_requests')
            .select()
            .eq('receiver_id', firstUserUID);
        print(res);
        expect(res, []);
        await supabase.auth.signInWithPassword(
          email: "test@example.com",
          password: "test123",
        );
      },
    );
  });
}
