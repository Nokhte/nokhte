import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class CaptureNokhteSessionStart
    implements AbstractFutureLogic<void, CaptureNokhteSessionStartParams> {
  final PosthogContract contract;

  CaptureNokhteSessionStart({required this.contract});

  @override
  call(params) async => await contract.captureNokhteSessionStart(params);
}

class CaptureNokhteSessionStartParams extends Equatable {
  final int numberOfCollaborators;
  final PresetTypes presetType;

  const CaptureNokhteSessionStartParams({
    required this.numberOfCollaborators,
    required this.presetType,
  });

  @override
  List<Object> get props => [numberOfCollaborators, presetType];
}
