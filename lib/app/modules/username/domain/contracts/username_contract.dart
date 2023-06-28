import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
import 'package:primala/app/modules/username/domain/entities/default_username_entity.dart';

abstract class UsernameContract {
  Future<Either<Failure, UsernameStatusEntity>> createUsername(String username);
  // ^^ Tied to the button

  Future<Either<Failure, DefaultUsernameEntity>> getDefaultUsername();
  // ^^ called on the screen loading

  Future<Either<Failure, UsernameStatusEntity>> checkIfUsernameIsCreated();
}
