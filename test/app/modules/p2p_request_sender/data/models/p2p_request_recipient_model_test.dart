// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/modules/p2p_request_sender/data/models/p2p_request_recipient_model.dart';
import '../../constants/supabase_responses.dart';

void main() {
  final tSuccessfulRequest = P2PRequestSenderRecipientModelParams(
    existsRes: SupabaseResponseConstants.nonEmptyResponse,
    recipDupRes: SupabaseResponseConstants.emptyResponse,
    senderDupRes: SupabaseResponseConstants.emptyResponse,
  );
  final tSenderDuplicate = P2PRequestSenderRecipientModelParams(
    existsRes: SupabaseResponseConstants.nonEmptyResponse,
    recipDupRes: SupabaseResponseConstants.emptyResponse,
    senderDupRes: SupabaseResponseConstants.nonEmptyResponse,
  );
  final tRecipDuplicate = P2PRequestSenderRecipientModelParams(
    existsRes: SupabaseResponseConstants.nonEmptyResponse,
    recipDupRes: SupabaseResponseConstants.nonEmptyResponse,
    senderDupRes: SupabaseResponseConstants.emptyResponse,
  );
  test('Authorized Request Returns Valid Model', () {
    final P2PRequestSenderRecipientModel res =
        P2PRequestSenderRecipientModel.fromSupabase(
      tSuccessfulRequest,
    );
    expect(res.exists, true);
    expect(res.duplicateRecipient, false);
    expect(res.duplicateSender, false);
  });
  test('Unauthorized Sender Duplicate should return the right model', () {
    final P2PRequestSenderRecipientModel res =
        P2PRequestSenderRecipientModel.fromSupabase(
      tSenderDuplicate,
    );

    expect(res.exists, true);
    expect(res.duplicateRecipient, false);
    expect(res.duplicateSender, true);
  });
  test(
      'Unauthorized Already Received Request Duplicate should return the right model',
      () {
    final P2PRequestSenderRecipientModel res =
        P2PRequestSenderRecipientModel.fromSupabase(
      tRecipDuplicate,
    );
    expect(res.exists, true);
    expect(res.duplicateRecipient, true);
    expect(res.duplicateSender, false);
  });
}
