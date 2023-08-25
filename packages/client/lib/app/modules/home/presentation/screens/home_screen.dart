// home_screen.dart
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/home/presentation/mobx/main/home_screen_coordinator_store.dart';
import 'package:swipe/swipe.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenCoordinatorStore homeScreenCoordinatorStore;
  late BeachWavesTrackerStore beachWavesTrackerStore;
  HomeScreen({
    super.key,
    required this.homeScreenCoordinatorStore,
  }) {
    beachWavesTrackerStore =
        homeScreenCoordinatorStore.beachWaveStateTrackerStore;
    homeScreenCoordinatorStore.homeScreenConstructorCallback();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (homeScreenCoordinatorStore
              .beachWaveStateTrackerStore.isReadyToTransition ==
          true) {
        Modular.to.navigate(
          '/p2p_collaborator_pool/',
          arguments: beachWavesTrackerStore.passingParam,
        );
      }
      return LayoutBuilder(
        builder: (context, constraints) {
          return PlatformScaffold(
            body: Swipe(
              onSwipeUp: () =>
                  homeScreenCoordinatorStore.homeScreenSwipeUpCallback(),
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SmartBeachWaves(
                      stateTrackerStore: beachWavesTrackerStore,
                    ),
                  ),
                  Center(
                      child: SmartFadingAnimatedText(
                    initialFadeInDelay: const Duration(seconds: 0),
                    stateTrackerStore:
                        homeScreenCoordinatorStore.fadingTextStateTrackerStore,
                  )),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//   // final SupabaseClient supabase;
//   final BeachWavesTrackerStore beachWaveStateTrackerStore;
//   final AddNameToDatabaseStore addNameToDatabaseStore;
//   final SmartFadingAnimatedTextTrackerStore fadingTextStateTrackerStore;
//   final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 1), () async {
//       await addNameToDatabaseStore(NoParams());
//       await getCollaboratorPhraseStore(NoParams()).then((_) {
//         fadingTextStateTrackerStore.setMainMessage(
//           index: 2,
//           thePhrase: getCollaboratorPhraseStore.collaboratorPhrase,
//         );
//       });
//     });
//   }

//   _HomeScreenState({
//     // required this.supabase,
//     required this.beachWaveStateTrackerStore,
//     required this.addNameToDatabaseStore,
//     required this.fadingTextStateTrackerStore,
//     required this.getCollaboratorPhraseStore,
//   });

  // @override
  // Widget build(BuildContext context) {
  //   return Observer(builder: (context) {
  //     if (beachWaveStateTrackerStore.isReadyToTransition == true) {
  //       Modular.to.navigate(
  //         '/p2p_collaborator_pool/',
  //         arguments: beachWaveStateTrackerStore.passingParam,
  //       );
  //     }
  //     return LayoutBuilder(
  //       builder: (context, constraints) {
  //         return PlatformScaffold(
  //           body: Swipe(
  //             onSwipeUp: () =>
  //                 beachWaveStateTrackerStore.homeScreenSwipeUpCallback(),
  //             child: Stack(
  //               children: [
  //                 SizedBox(
  //                   width: MediaQuery.of(context).size.width,
  //                   height: MediaQuery.of(context).size.height,
  //                   child: SmartBeachWaves(
  //                     stateTrackerStore: beachWaveStateTrackerStore,
  //                   ),
  //                 ),
  //                 Center(
  //                     child: SmartFadingAnimatedText(
  //                   initialFadeInDelay: const Duration(seconds: 0),
  //                   stateTrackerStore: fadingTextStateTrackerStore,
  //                 )),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   });
  // }
// }
