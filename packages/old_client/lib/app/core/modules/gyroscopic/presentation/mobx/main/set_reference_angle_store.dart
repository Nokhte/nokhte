// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
part 'set_reference_angle_store.g.dart';

class SetReferenceAngleStore = _SetReferenceAngleStoreBase
    with _$SetReferenceAngleStore;

abstract class _SetReferenceAngleStoreBase
    extends BaseMobxDBStore<int, ReferenceAngleSetterStatusEntity> with Store {
  final SetReferenceAngle getterStore;
  _SetReferenceAngleStoreBase({required this.getterStore});

  @action
  @override
  call(params) async {
    getterStore(params);
  }
}
