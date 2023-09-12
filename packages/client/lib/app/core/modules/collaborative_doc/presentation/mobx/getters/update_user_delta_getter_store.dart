// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
// * Mobx Codegen Inclusion
part 'update_user_delta_getter_store.g.dart';

class UpdateUserDeltaGetterStore = _UpdateUserDeltaGetterStoreBase
    with _$UpdateUserDeltaGetterStore;

abstract class _UpdateUserDeltaGetterStoreBase extends Equatable with Store {
  final UpdateUserDelta logic;

  _UpdateUserDeltaGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, CollaborativeDocDeltaUpdaterStatusEntity>> call(
          UpdateUserDeltaParams params) async =>
      await logic(params);

  @override
  List<Object> get props => [
// some items
      ];
}
