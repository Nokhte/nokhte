import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/entities/p2p_recipient_request_entity.dart';
import 'package:primala/app/modules/authentication/domain/entities/name_creation_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/entities/p2p_recipient_request_presentational_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_request_sender/domain/entities/p2p_request_sender_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/confirm_p2p_scheduling_time_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';
import 'package:primala/app/modules/deprecated/username/domain/entities/default_username_entity.dart';
import 'package:primala/app/modules/deprecated/username/domain/entities/username_status_entity.dart';

class DefaultEntities {
  static Either<Failure, UsernameStatusEntity> get usernameStatusEntity =>
      const Right(UsernameStatusEntity(isCreated: false));
  static Either<Failure, DefaultUsernameEntity> get defaultUsernameEntity =>
      const Right(DefaultUsernameEntity(defaultUsername: ''));

  static Either<Failure, NameCreationStatusEntity>
      get nameCreationStatusEntity =>
          const Right(NameCreationStatusEntity(isSent: false));

  static Either<Failure, P2PRequestRecipientEntity>
      get p2pRequestRecipientEntity => const Right(P2PRequestRecipientEntity(
            exists: false,
            duplicateRecipient: false,
            duplicateSender: false,
          ));
  static Either<Failure, P2PRequestSenderStatusEntity>
      get p2pSenderStatusEntity =>
          const Right(P2PRequestSenderStatusEntity(isSent: false));

  static Either<Failure, P2PRequestRecipientResponseStatusEntity>
      get p2pReqRecipResStatus => const Right(
            P2PRequestRecipientResponseStatusEntity(isSent: false),
          );

  static Either<Failure, P2PRecipientRequestEntity> get p2pRecipReqEntity =>
      const Right(
        P2PRecipientRequestEntity(
          requests: [],
        ),
      );
  static Either<Failure, P2PRecipientRequestPresentationalEntity>
      get p2pPresentationalRecipReqEntity => const Right(
            P2PRecipientRequestPresentationalEntity(
              requests: [],
            ),
          );
  static P2PRecipientRequestEntity get unwrappedDefaultP2PRecipReqEntity =>
      const P2PRecipientRequestEntity(
        requests: [],
      );

  static Either<Failure, P2PRequestRecipientResponseStatusEntity>
      get p2pRequestRecipResEntity => const Right(
            P2PRequestRecipientResponseStatusEntity(
              isSent: false,
            ),
          );

  static Either<Failure, P2PSchedulingRequestStatusEntity>
      get p2pSchedulingSenderReqStatEnt => const Right(
            P2PSchedulingRequestStatusEntity(isSent: false),
          );
  static Either<Failure, ConfirmP2PSchedulingTimeStatusEntity>
      get p2pSchedulingConfirmTimeStatusEnt => const Right(
            ConfirmP2PSchedulingTimeStatusEntity(isSent: false),
          );
  static Either<Failure, P2PSchedulingResponseStatusEntity>
      get p2pSchedulingResponseStatusEntity => const Right(
            P2PSchedulingResponseStatusEntity(isSent: false),
          );
}
