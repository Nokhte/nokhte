// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
part 'update_presence_getter_store.g.dart';

class UpdatePresenceGetterStore = _UpdatePresenceGetterStoreBase
    with _$UpdatePresenceGetterStore;

abstract class _UpdatePresenceGetterStoreBase extends Equatable with Store {
  final UpdatePresence logic;

  _UpdatePresenceGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, PresenceUpdateStatusEntity>> call(params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
