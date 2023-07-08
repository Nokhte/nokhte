import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/username/data/models/default_username_model.dart';
import 'package:primala/app/modules/username/data/models/username_status_model.dart';

import 'username_data_constants.dart';

class UsernameModelConstants {
  static Right<Failure, UsernameStatusModel> get successUsernameStatusModel =>
      const Right(UsernameStatusModel(isCreated: true));
  static Right<Failure, UsernameStatusModel>
      get notSuccessUsernameStatusModel =>
          const Right(UsernameStatusModel(isCreated: false));
  static Right<Failure, DefaultUsernameModel> get defaultUsernameModel => Right(
      DefaultUsernameModel(defaultUsername: UsernameDataConstants.username));
}
