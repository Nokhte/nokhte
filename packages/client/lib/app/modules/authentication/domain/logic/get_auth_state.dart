// * Primala Domain Imports
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
// * Primala Core Imports
import 'package:primala/app/core/interfaces/logic.dart';

class GetAuthState extends AbstractSyncNoFailureLogic<AuthEntity, NoParams> {
  final AuthenticationContract contract;

  GetAuthState({required this.contract});

  @override
  AuthEntity call(NoParams params) => contract.getAuthState();
}
