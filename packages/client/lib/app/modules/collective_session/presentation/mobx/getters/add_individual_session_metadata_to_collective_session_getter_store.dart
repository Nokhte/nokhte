// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
part 'add_individual_session_metadata_to_collective_session_getter_store.g.dart';

class AddIndividualSessionMetadataToCollectiveSessionGetterStore = _AddIndividualSessionMetadataToCollectiveSessionGetterStoreBase
    with _$AddIndividualSessionMetadataToCollectiveSessionGetterStore;

abstract class _AddIndividualSessionMetadataToCollectiveSessionGetterStoreBase
    extends Equatable with Store {
  final AddIndividualSessionMetadataToCollectiveSession logic;

  _AddIndividualSessionMetadataToCollectiveSessionGetterStoreBase({
    required this.logic,
  });

  Future<
          Either<Failure,
              InvidualMetadataAdditionToCollectiveSessionStatusEntity>>
      call(params) async => await logic(params);

  @override
  List<Object> get props => [];
}
