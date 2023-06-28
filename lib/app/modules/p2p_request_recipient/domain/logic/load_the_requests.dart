import 'package:primala/app/core/constants/entities.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'dart:async';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/contracts/p2p_request_recipient_contract.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_presentational_entity.dart';

class LoadTheRequests extends AbstractFutureLogic<
    P2PRecipientRequestPresentationalEntity, NoParams> {
  final P2PRequestRecipientContract contract;
  Timer? timer;
  DateTime presentMoment;
  P2PRecipientRequestEntity currentContractResponse =
      DefaultEntities.unwrappedDefaultP2PRecipReqEntity;

  LoadTheRequests({required this.contract, required this.presentMoment}) {
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) {
        updateRelativeTimes(currentContractResponse);
      },
    );
  }

  updateRelativeTimes(P2PRecipientRequestEntity requestEntity) {
    final presentationalRequestsList = requestEntity.requests.map((element) {
      final requestDateTime = DateTime.parse(element.timestampz);
      final difference = presentMoment.difference(requestDateTime);
      String relativeTime;

      if (difference.inHours >= 24) {
        final days = difference.inDays;
        relativeTime = "$days day${days > 1 ? 's' : ''} ago";
      } else if (difference.inHours < 24 && difference.inHours >= 1) {
        final hours = difference.inHours;
        relativeTime = "$hours hour${hours > 1 ? 's' : ''} ago";
      } else {
        final minutes = difference.inMinutes;
        relativeTime = "$minutes minute${minutes > 1 ? 's' : ''} ago";
      }

      return P2PPresentationalRecipientRequest(
        relativeTimeString: relativeTime,
        senderUsername: element.senderUsername,
      );
    }).toList();

    return P2PRecipientRequestPresentationalEntity(
        requests: presentationalRequestsList);
  }

  @override
  Future<Either<Failure, P2PRecipientRequestPresentationalEntity>> call(
      NoParams params) async {
    final res = await contract.loadTheRequests(); // either
    return res.fold(
      (failure) => Left(failure),
      (requestEntity) {
        currentContractResponse = requestEntity;
        return Right(updateRelativeTimes(requestEntity));
      },
    );
  }
}
