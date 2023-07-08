// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/username/presentation/mobx/main/create_username_store.dart';
import 'package:primala/app/modules/username/presentation/mobx/main/get_default_username_store.dart';
import 'package:primala/app/modules/username/presentation/widgets/create_username_widget.dart';
import 'package:primala/app/modules/username/presentation/mobx/main/check_if_username_is_created_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// inject
class CreateUsernameScreen extends StatefulWidget {
  final GetDefaultUsernameStore getDefaultUsernameStore;
  final CreateUsernameStore createUsernameStore;
  final CheckIfUsernameIsCreatedStore checkIfUsernameIsCreatedStore;

  const CreateUsernameScreen({
    Key? key,
    required this.getDefaultUsernameStore,
    required this.createUsernameStore,
    required this.checkIfUsernameIsCreatedStore,
  }) : super(key: key);

  @override
  _CreateUsernameScreenState createState() => _CreateUsernameScreenState(
        getDefaultUsernameStore: getDefaultUsernameStore,
        createUsernameStore: createUsernameStore,
        checkIfUsernameIsCreatedStore: checkIfUsernameIsCreatedStore,
      );
}

class _CreateUsernameScreenState extends State<CreateUsernameScreen> {
  final GetDefaultUsernameStore getDefaultUsernameStore;
  final CreateUsernameStore createUsernameStore;
  final CheckIfUsernameIsCreatedStore checkIfUsernameIsCreatedStore;

  _CreateUsernameScreenState({
    required this.getDefaultUsernameStore,
    required this.createUsernameStore,
    required this.checkIfUsernameIsCreatedStore,
  });

  @override
  void initState() {
    super.initState();
    checkIfUsernameIsCreatedStore(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: Observer(
          builder: (context) {
            final futureStatus = checkIfUsernameIsCreatedStore
                .futureStore.entityOrFailureFuture.status;
            if (futureStatus == FutureStatus.pending) {
              return PlatformCircularProgressIndicator();
            } else {
              checkIfUsernameIsCreatedStore.futureStore.unwrappedEntityOrFailure
                  .fold((failure) => null, (userStatusEntity) {
                if (userStatusEntity.isCreated) {
                  Modular.to.navigate('/home');
                }
              });
            }
            if (checkIfUsernameIsCreatedStore.usernameIsCreated == false &&
                futureStatus == FutureStatus.fulfilled) {
              return CreateUsernameWidget(
                createUsernameStore: createUsernameStore,
                getDefaultUsernameStore: getDefaultUsernameStore,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
