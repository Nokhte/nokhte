// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/deprecated/username/domain/logic/create_username.dart';
import 'package:primala/app/modules/deprecated/username/presentation/mobx/main/create_username_store.dart';
import 'package:primala/app/modules/deprecated/username/presentation/mobx/main/get_default_username_store.dart';

class CreateUsernameWidget extends StatefulWidget {
  final GetDefaultUsernameStore getDefaultUsernameStore;
  final CreateUsernameStore createUsernameStore;
  const CreateUsernameWidget({
    Key? key,
    required this.createUsernameStore,
    required this.getDefaultUsernameStore,
  }) : super(key: key);

  @override
  _CreateUsernameWidgetState createState() => _CreateUsernameWidgetState();
}

class _CreateUsernameWidgetState extends State<CreateUsernameWidget> {
  final getDefaultUsernameStore = Modular.get<GetDefaultUsernameStore>();
  final createUsernameStore = Modular.get<CreateUsernameStore>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    getDefaultUsernameStore(NoParams());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Observer(builder: (BuildContext context) {
        final defaultFutureStatus =
            getDefaultUsernameStore.futureStore.entityOrFailureFuture.status;
        final createUsernameFutureStatus =
            createUsernameStore.futureStore.entityOrFailureFuture.status;

        if (createUsernameStore.usernameIsCreated) {
          Modular.to.navigate('/home/');
        }

        if (defaultFutureStatus == FutureStatus.pending ||
            createUsernameFutureStatus == FutureStatus.pending) {
          return PlatformCircularProgressIndicator();
        } else {
          getDefaultUsernameStore.futureStore.unwrappedEntityOrFailure.fold(
            (failure) => null,
            (defaultUsernameEntity) {
              if (defaultUsernameEntity.defaultUsername.isNotEmpty) {
                _controller = TextEditingController(
                  text: getDefaultUsernameStore.defaultUsername,
                );
              }
            },
          );
        }
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: PlatformText(
                  'Create Username',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PlatformTextField(
                    controller: _controller,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PlatformElevatedButton(
                  onPressed: () async {
                    await createUsernameStore(
                      CreateUserParams(username: _controller.text),
                    );
                    // ^^ so this will be called how
                  },
                  child: PlatformText('Create Username'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
