import 'package:dartz/dartz.dart';
import 'package:primala/app/modules/p2p_request_recipient/data/models/p2p_recipient_request_model.dart';
import 'package:primala/app/modules/p2p_request_recipient/data/models/p2p_recipient_response_status_model.dart';
import './sample_data_source_responses.dart';

class ConstantModels {
  static get wrappedNonEmptyP2PRecipReqModel => Right(
        P2PRecipientRequestModel(
            requests: SampleDataSourceResonses.recipientReqList),
      );

  static get unwrappedNonEmptyP2PRecipReqModel => P2PRecipientRequestModel(
      requests: SampleDataSourceResonses.recipientReqList);

  static get wrappedEmptyP2PRecipReqModel =>
      const Right(P2PRecipientRequestModel(requests: []));

  static get unwrappedEmptyP2PRecipReqModel =>
      const P2PRecipientRequestModel(requests: []);

  static get wrappedSuccessfulEmptyP2PRecipReqResStatusModel =>
      const Right(P2PRequestRecipientResponseStatusModel(isSent: true));

  static get unwrappedNotSuccessfulP2PRecipReqResStatusModel =>
      const P2PRequestRecipientResponseStatusModel(isSent: false);

  static get unwrappedSuccessfulP2PRecipReqResStatusModel =>
      const P2PRequestRecipientResponseStatusModel(isSent: true);
}
