// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/mobx/mobx.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'set_reference_angle_store.g.dart';

class SetReferenceAngleStore = _SetReferenceAngleStoreBase
    with _$SetReferenceAngleStore;

abstract class _SetReferenceAngleStoreBase
    extends BaseMobxDBStore<int, ReferenceAngleSetterStatusEntity> with Store {
  final SetReferenceAngleGetterStore getterStore;
  _SetReferenceAngleStoreBase({required this.getterStore});

  @action
  @override
  call(params) async {
    getterStore(params);
  }
}
