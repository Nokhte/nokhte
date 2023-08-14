// ignore_for_file: file_names

import 'package:primala_backend/constants/general/sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:primala_backend/constants/general/supabase_client_constants.dart';
import 'package:primala_backend/constants/general/user_setup_constants.dart';
import 'package:primala_backend/util/deprecated/p2p_scheduling/p2p_scheduling_row_request.dart';
import 'package:primala_backend/constants/general/timestampz.dart';
import 'package:primala_backend/util/deprecated/p2p_requests/supabase_p2p_request_row_response.dart';
import 'package:primala_backend/util/deprecated/p2p_scheduling/common_p2p_scheduling_queries.dart';

void main() {
  late SupabaseClient supabase;
  late SupabaseClient supabaseAdmin;
  late String firstUserUID;
  late String secondUserUID;
  late P2PSchedulingRequest tSchedulingRequest;

  setUpAll(() async {
    supabase = SupabaseClientConfigConstants.supabase;
    supabaseAdmin = SupabaseClientConfigConstants.supabaseAdmin;
    final userIdResults = await UserSetupConstants.fetchUIDs();
    firstUserUID = userIdResults[0];
    secondUserUID = userIdResults[1];
  });

  group("USER 1 ACTIONS:", () {
    setUp(() async {
      tSchedulingRequest = P2PSchedulingRequest(
        senderId: firstUserUID,
        receiverId: secondUserUID,
        initialTimeRanges: {
          "ranges": Timestampz.juneTenthMorningRanges,
        },
      );
      await SignIn.user1(supabase: supabase);
    });

    tearDown(() async {
      await supabaseAdmin
          .from('p2p_scheduling')
          .delete()
          .eq('sender_id', firstUserUID);

      await supabase.auth.signOut();
    });

    test(
      "❌ CREATE: Can't Send To Themselves",
      () async {
        // arrange + act
        tSchedulingRequest = P2PSchedulingRequest(
          senderId: firstUserUID,
          receiverId: firstUserUID,
          initialTimeRanges: {
            "ranges": Timestampz.juneTenthMorningRanges,
          },
        );
        try {
          final failedRes = await supabase
              .from('p2p_scheduling')
              .insert(tSchedulingRequest.toJson());
          expect(failedRes, throwsException);
        } catch (e) {
          expect(e, isA<PostgrestException>());
        }
      },
    );
    test(
      "❌ CREATE: Can't Impersonate a request",
      () async {
        // arrange + act
        tSchedulingRequest = P2PSchedulingRequest(
          senderId: secondUserUID,
          receiverId: firstUserUID,
          initialTimeRanges: {
            "ranges": Timestampz.juneTenthMorningRanges,
          },
        );
        try {
          final failedRes = await supabase
              .from('p2p_scheduling')
              .insert(tSchedulingRequest.toJson());
          expect(failedRes, throwsException);
        } catch (e) {
          expect(e, isA<PostgrestException>());
        }
      },
    );
    test(
      "❌ CREATE: Can't Send a Schedule Request if p2p_request doesn't exist",
      () async {
        // arrange + act
        tSchedulingRequest = P2PSchedulingRequest(
          senderId: firstUserUID,
          receiverId: secondUserUID,
          initialTimeRanges: {
            "ranges": Timestampz.juneTenthMorningRanges,
          },
        );
        try {
          final failedRes = await supabase
              .from('p2p_scheduling')
              .insert(tSchedulingRequest.toJson());
          expect(failedRes, throwsException);
        } catch (e) {
          expect(e, isA<PostgrestException>());
        }
      },
    );

    group("USER 1 HAS SENT A P2P Request... THEN", () {
      setUp(() async {
        await supabaseAdmin.from('p2p_requests').insert(
            SupabaseP2PRequestRowResponse(
                    sender_id: firstUserUID,
                    receiver_id: secondUserUID,
                    sent_at: DateTime.now().toIso8601String(),
                    responded_at: DateTime.now().toIso8601String(),
                    is_accepted: true)
                .toJson());
      });

      tearDown(() async {
        await supabaseAdmin
            .from('p2p_requests')
            .delete()
            .eq('sender_id', firstUserUID)
            .eq('receiver_id', secondUserUID);
      });
      test("✅ CREATE: Can Send A Request If Request Has Been Accepted",
          () async {
        // arrange
        await supabase
            .from('p2p_scheduling')
            .insert(tSchedulingRequest.toJson());
        final res = await CommonP2PSchedulingQueries.readTheSchedulingRequest(
            supabase: supabase,
            firstUserUID: firstUserUID,
            secondUserUID: secondUserUID);
        print(res);
        expect(res, isNotEmpty);
      });
      test("✅ READ: Can Only Select Requests they've Authored", () async {
        // arrange
        await supabaseAdmin.from('p2p_scheduling').insert(tSchedulingRequest);
        // act
        final res = await CommonP2PSchedulingQueries.readTheSchedulingRequest(
            supabase: supabase,
            firstUserUID: firstUserUID,
            secondUserUID: secondUserUID);

        expect(res, isNotEmpty);
      });
      group("USER 1 SENDS SCHEDULING REQUEST REQUEST... THEN: ", () {
        setUp(() async {
          // @ Initial request from User 1
          await supabase.from('p2p_scheduling').insert(tSchedulingRequest);
        });

        test(
            "❌ CREATE: USER1 shouldn't be able to send another scheduling request when it's un-resolved",
            () async {
          try {
            final failedRes = await supabase
                .from('p2p_scheduling')
                .insert(tSchedulingRequest.toJson());
            expect(failedRes, throwsException);
          } catch (e) {
            expect(e, isA<PostgrestException>());
          }
        });
        test(
            "❌ UPDATE: USER1 shouldn't be able to update time_is_agreed_upon if recipient hasn't responded yet",
            () async {
          try {
            // # act
            final failedRes = await supabase
                .from('p2p_scheduling')
                .update({'time_is_agreed_upon': true})
                .eq('sender_id', firstUserUID)
                .eq('receiver_id', secondUserUID);
            // # assert
            expect(failedRes, throwsException);
          } catch (e) {
            expect(e, isA<PostgrestException>());
          }
        });

        test(
            "❌ UPDATE: USER1 sends 👍🏽Scheduling Request, USER2 RESPONDS with 👍🏽 TIMESTAMPZ & USER1 Attempts a 👎🏽 UPDATE",
            () async {
          await SignIn.user2(supabase: supabase);
          // @ from user 2
          await CommonP2PSchedulingQueries.successfulUser2SchedulingRes(
              supabase: supabase,
              firstUserUID: firstUserUID,
              secondUserUID: secondUserUID);
          await SignIn.user1(supabase: supabase);
          try {
            final failedRes = await supabase
                .from('p2p_scheduling')
                .update(
                    {'receiver_id': firstUserUID, 'time_is_agreed_upon': true})
                .eq('sender_id', firstUserUID)
                .eq('receiver_id', secondUserUID);
            expect(failedRes, throwsException);
          } catch (e) {
            final res =
                await CommonP2PSchedulingQueries.readTheSchedulingRequest(
                    supabase: supabase,
                    firstUserUID: firstUserUID,
                    secondUserUID: secondUserUID);
            expect(res[0]["receiver_id"], secondUserUID);
            expect(res[0]["time_is_agreed_upon"], false);
          }
        });

        test("INTEGRAION: ✅ Proper Scheduling Handshake between USER1 & USER2",
            () async {
          // @ from user 1
          await SignIn.user2(supabase: supabase);
          // @ from user 2
          await CommonP2PSchedulingQueries.successfulUser2SchedulingRes(
            supabase: supabase,
            firstUserUID: firstUserUID,
            secondUserUID: secondUserUID,
          );
          await SignIn.user1(supabase: supabase);
          await CommonP2PSchedulingQueries.successfulUser1ConfirmationRes(
            supabase: supabase,
            firstUserUID: firstUserUID,
            secondUserUID: secondUserUID,
          );
          final res = await CommonP2PSchedulingQueries.readTheSchedulingRequest(
              supabase: supabase,
              firstUserUID: firstUserUID,
              secondUserUID: secondUserUID);
          expect(res[0]["receiver_id"], secondUserUID);
          expect(res[0]["time_is_agreed_upon"], true);
        });

        test("✅ READ: USER 2 Can Only Select Requests they've Received",
            () async {
          // # Arrange
          await SignIn.user2(supabase: supabase);
          // # Act
          final res = await CommonP2PSchedulingQueries.readTheSchedulingRequest(
            firstUserUID: firstUserUID,
            secondUserUID: secondUserUID,
            supabase: supabase,
          );
          // # Assert
          expect(res, isNotEmpty);
        });
        // @ END of User 1 Then User 2
      });
      // @ END OF USER 1 SENDS P2P REQUEST THEN...
    });
  });
  // @ END USER 1 Actions Group
}
