import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';

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
