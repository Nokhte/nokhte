import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

mixin ResponseToStatus {
  Either<Failure, bool> fromSupabase(List response) {
    if (response.isEmpty) {
      return const Right(false);
    } else {
      return const Right(true);
    }
  }

  T fromSupabaseProperty<T>(List res, String property, T defaultType) {
    if (res.isEmpty) {
      return defaultType;
    } else {
      return res.first[property];
    }
  }

  Either<Failure, bool> fromFunctionResponse(FunctionResponse res) {
    if (res.data["status"] == 200) {
      return const Right(true);
    } else {
      return Left(FailureConstants.invalidDeepLinkFailure);
    }
  }
}
