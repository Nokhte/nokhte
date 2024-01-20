import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/types/deep_link_types.dart';

abstract class DeepLinksContract {
  Stream<Map> listenForOpenedDeepLink(
    NoParams params,
  );
  Future<Either<Failure, String>> getDeepLinkURL(
    DeepLinkTypes params,
  );
  Future<Either<Failure, bool>> sendDeepLink(
    String params,
  );
}
