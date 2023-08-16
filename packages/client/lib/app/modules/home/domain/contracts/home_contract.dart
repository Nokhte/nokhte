import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/home/domain/entities/name_creation_status_entity.dart';

abstract class HomeContract {
  Future<Either<Failure, NameCreationStatusEntity>> addNameToDatabase();
}
