// * Primala Domain Imports
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
// * Primala Core Imports
import 'package:nokhte/app/core/interfaces/logic.dart';

class GetAuthState
    extends AbstractSyncNoFailureLogic<AuthStateEntity, NoParams> {
  final AuthenticationContract contract;

  GetAuthState({required this.contract});

  @override
  AuthStateEntity call(NoParams params) => contract.getAuthState();
}
