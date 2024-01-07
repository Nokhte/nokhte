import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';

abstract class DeepLinksContract {
  Future<Either<Failure, DeepLinkInfoEntity>> getLatestOpenedDeeplink(
    NoParams params,
  );
  Future<Either<Failure, DeepLinkUrlEntity>> getDeepLinkURL(
    GetDeepLinkURLParams params,
  );
  Future<Either<Failure, DeepLinkSendStatusEntity>> sendDeepLink(
    String params,
  );
}
