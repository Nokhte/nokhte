// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
part 'update_session_metadata_getter_store.g.dart';

class UpdateSessionMetadataGetterStore = _UpdateSessionMetadataGetterStoreBase
    with _$UpdateSessionMetadataGetterStore;

abstract class _UpdateSessionMetadataGetterStoreBase extends Equatable
    with Store {
  final UpdateSessionMetadata logic;

  _UpdateSessionMetadataGetterStoreBase({
    required this.logic,
  });

  Future<Either<Failure, IndividualSessionMetadataUpdateStatusEntity>> call(
          params) async =>
      await logic(params);

  @override
  List<Object> get props => [];
}
