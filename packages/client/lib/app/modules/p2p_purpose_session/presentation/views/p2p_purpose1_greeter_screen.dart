// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:primala/app/core/widgets/widgets.dart';
// import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/main/coordinators/p2p_purpose_phase1_coordinator_store.dart';
// import 'package:swipe/swipe.dart';

// class P2PPurpose1GreeterScreen extends StatelessWidget {
//   final P2PPurposePhase1CoordinatorStore coordinator;
//   P2PPurpose1GreeterScreen({
//     super.key,
//     required this.coordinator,
//   }) {
//     coordinator.screenConstructorCallback();
//   }

// ignore_for_file: no_logic_in_create_state, library_private_types_in_public_api

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: ((context, constraints) => PlatformScaffold(
//               body: Swipe(
//             onSwipeUp: () {
//               print("swipe up!!");
//               coordinator.swipeUpCallback();
//             },
//             child: Stack(
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   child: SmartBeachWaves(
//                     stateTrackerStore: coordinator.beachWaves,
//                   ),
//                 ),
//               ],
//             ),
//           ))),
//     );
//     // });
//   }
// }
// ================================================================================
import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/main/coordinators/p2p_purpose_phase1_coordinator_store.dart';

class P2PPurpose1GreeterScreen extends StatefulWidget {
  final RtcEngine agoraEngine;
  const P2PPurpose1GreeterScreen({
    Key? key,
    required this.coordinator,
    required this.agoraEngine,
  }) : super(key: key);
  final P2PPurposePhase1CoordinatorStore coordinator;

  @override
  _P2PPurpose1GreeterScreenState createState() =>
      _P2PPurpose1GreeterScreenState(
        coordinator: coordinator,
        agoraEngine: agoraEngine,
      );
}

class _P2PPurpose1GreeterScreenState extends State<P2PPurpose1GreeterScreen> {
  final P2PPurposePhase1CoordinatorStore coordinator;
  final RtcEngine agoraEngine;

  _P2PPurpose1GreeterScreenState({
    required this.coordinator,
    required this.agoraEngine,
  });
  String channelName = "80ea-fc0e";

  @override
  void initState() {
    super.initState();

    // Set up an instance of Agora engine
    // setupVoiceSDKEngine();

    Future.delayed(Duration(seconds: 0), () async {
      await coordinator.instantiateAgoraSdkStore(NoParams());
      await coordinator.fetchChannelIdStore(NoParams()).then((_) async {});
      await coordinator.fetchAgoraTokenStore(FetchAgoraTokenParams(
        channelName: channelName,
        // channelName: coordinator.fetchChannelIdStore.channelId,
      ));
      print(
          "DID IT WORK? channel id ==> ${coordinator.fetchChannelIdStore.channelId} \n token ===> ${coordinator.fetchAgoraTokenStore.token}");
    });
  }

  String token =
      "007eJxTYEh4mbv/d2JDyd7Sf8a8LQLvDvepGSfeWX5eVFk0+OZeiY0KDAamBklGRklmFhZpJiYmZiZJRqbGxmmJySYWJsnmxgYGBrwfUxoCGRmEmB6yMjJAIIjPyWBhkJqom5ZskMrAAADb1R8/";

  int uid = 8886465723192282204; // uid of the local user

  int? _remoteUid; // uid of the remote user
  bool _isJoined = false; // Indicates if the local user has joined the channel
  // late RtcEngine agoraEngine; // Agora engine instance

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>(); // Global key to access the scaffold

  // Clean up the resources when you leave
  @override
  void dispose() async {
    await agoraEngine.leaveChannel();
    super.dispose();
  }

  // void leave() {
  //   setState(() {
  //     _isJoined = false;
  //     _remoteUid = null;
  //   });
  //   agoraEngine.leaveChannel();
  // }

  // void join() async {
  //   // Set channel options including the client role and channel profile
  //   ChannelMediaOptions options = const ChannelMediaOptions(
  //     clientRoleType: ClientRoleType.clientRoleBroadcaster,
  //     channelProfile: ChannelProfileType.channelProfileCommunication,
  //   );
  //   print(
  //       "does that match these? ${coordinator.fetchAgoraTokenStore.token} ${coordinator.fetchChannelIdStore.channelId}");

  //   await agoraEngine.joinChannel(
  //     // token: token,
  //     token: coordinator.fetchAgoraTokenStore.token,
  //     channelId: coordinator.fetchChannelIdStore.channelId,
  //     options: options,
  //     uid: uid,
  //   );
  // }

  // showMessage(String message) {
  //   scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
  //     content: Text(message),
  //   ));
  // }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Get started with Voice Calling'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            children: [
              // Status text
              Container(height: 40, child: Center(child: _status())),
              // Button Row
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: const Text("Join"),
                      onPressed: () => {
                        coordinator.voiceCallActionsStore.joinCallGetterStore(
                          channelId: coordinator.fetchChannelIdStore.channelId,
                          token: coordinator.fetchAgoraTokenStore.token,
                        ),
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text("Leave"),
                      onPressed: () => {
                        coordinator.voiceCallActionsStore
                            .leaveCallGetterStore(),
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget _status() {
    String statusText;

    if (!_isJoined)
      statusText = 'Join a channel';
    else if (_remoteUid == null)
      statusText = 'Waiting for a remote user to join...';
    else
      statusText = 'Connected to remote user, uid:$_remoteUid';

    return Text(
      statusText,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Placeholder();
  // }
}
