import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_presentational_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';

import 'sample_data_source_responses.dart';

// P2PRecipientRequestEntity
// P2PRequestRecipientResponseStatusEntity
class ConstantEntities {
  static P2PRecipientRequestEntity get successfulP2PRecipientRequestEntity =>
      P2PRecipientRequestEntity(
        requests: SampleDataSourceResonses.recipientReqList,
      );
  static P2PRecipientRequestEntity get notSuccessfulP2PRecipientRequestEntity =>
      const P2PRecipientRequestEntity(requests: []);
  static P2PRequestRecipientResponseStatusEntity
      get successfulP2PRequestRecipientResponseStatusEntity =>
          const P2PRequestRecipientResponseStatusEntity(isSent: true);
  static P2PRequestRecipientResponseStatusEntity
      get notSuccessfulP2PRequestRecipientResponseStatusEntity =>
          const P2PRequestRecipientResponseStatusEntity(isSent: false);

  static P2PRecipientRequestPresentationalEntity
      get formattedSuccessfulP2PRecipientRequestEntity =>
          P2PRecipientRequestPresentationalEntity(
            requests: SampleDataSourceResonses.formattedRelativeTimes,
          );
}
