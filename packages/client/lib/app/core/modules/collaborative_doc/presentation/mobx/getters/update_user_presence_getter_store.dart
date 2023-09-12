// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'update_user_presence_getter_store.g.dart';

class UpdateUserPresenceGetterStore = _UpdateUserPresenceGetterStoreBase
    with _$UpdateUserPresenceGetterStore;

abstract class _UpdateUserPresenceGetterStoreBase extends Equatable with Store {
  final UpdateUserPresence logic;

  _UpdateUserPresenceGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaborativeDocPresenceUpdaterStatusEntity>> call(
          UpdateUserPresenceParams params) async =>
      logic(params);

  @override
  List<Object> get props => [];
}
