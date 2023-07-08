// * Required Flutter Imports
// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// * Modular
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/send_a_request.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/logic/validate_request.dart';
// * Mobx
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/main/validate_request_store.dart';
import 'package:primala/app/modules/p2p_request_sender/presentation/mobx/main/send_a_request_store.dart';
import 'dart:async';

// TODO 👹
class SendARequestScreen extends StatefulWidget {
  final SendARequestStore sendARequestStore;
  final ValidateRequestStore validateRequestStore;

  const SendARequestScreen({
    Key? key,
    required this.sendARequestStore,
    required this.validateRequestStore,
  }) : super(key: key);

  @override
  _SendARequestScreenState createState() => _SendARequestScreenState(
        sendARequestStore: sendARequestStore,
        validateRequestStore: validateRequestStore,
      );
}

class _SendARequestScreenState extends State<SendARequestScreen> {
  bool buttonIsDisabled = true;
  final SendARequestStore sendARequestStore;
  final ValidateRequestStore validateRequestStore;
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  _onSearchChange(String userQuery) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
        const Duration(
          milliseconds: 600,
        ), () async {
      _updateButtonText(
        exists: validateRequestStore.recipientExists,
        dupSender: validateRequestStore.duplicateSender,
        dupRecip: validateRequestStore.duplicateRecipient,
      );
      await validateRequestStore(
        P2PReqRecipientParams(username: userQuery),
      );
    });
  }

  String _updateButtonText({
    required bool dupSender,
    required bool dupRecip,
    required bool exists,
  }) {
    if (validateRequestStore.state == StoreState.initial) {
      return "Search User";
    } else if (exists == false &&
        validateRequestStore.state == StoreState.loaded) {
      return "User Doesn't Exist";
    } else if (dupRecip == true) {
      return "You have Been Sent a Request Already";
    } else if (dupSender == true) {
      return "You have already sent this";
    } else {
      return "Send a Request";
    }
  }

  _SendARequestScreenState({
    required this.sendARequestStore,
    required this.validateRequestStore,
  });

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      // make child an observer type
      body: Observer(
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 100),
                    child: PlatformText(
                      'Find User',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PlatformTextField(
                      controller: _controller,
                      onChanged: (text) => _onSearchChange(text),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: PlatformElevatedButton(
                    onPressed: () async {
                      await sendARequestStore(
                          P2PSendReqParams(username: _controller.text));
                    },
                    child: PlatformText(
                      _updateButtonText(
                        exists: validateRequestStore.recipientExists,
                        dupSender: validateRequestStore.duplicateSender,
                        dupRecip: validateRequestStore.duplicateRecipient,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
