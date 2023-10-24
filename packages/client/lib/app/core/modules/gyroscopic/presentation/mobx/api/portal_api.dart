// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'portal_api.g.dart';

class PortalAPI = _PortalAPIBase with _$PortalAPI;

abstract class _PortalAPIBase extends GyroscopeAPI with Store {
  @override
  List<Object> get props => [];
}
