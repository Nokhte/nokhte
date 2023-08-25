// home_screen.dart
// ignore_for_file: sized_box_for_whitespace, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/widgets/smart_beach_waves.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/smart_fading_animated_text.dart';
import 'package:primala/app/modules/home/presentation/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swipe/swipe.dart';

class HomeScreen extends StatefulWidget {
  final SupabaseClient supabase;
  final BeachWavesTrackerStore beachWaveStateTrackerStore;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final SmartFadingAnimatedTextTrackerStore fadingTextStateTrackerStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;
  const HomeScreen({
    Key? key,
    required this.supabase,
    required this.beachWaveStateTrackerStore,
    required this.addNameToDatabaseStore,
    required this.fadingTextStateTrackerStore,
    required this.getCollaboratorPhraseStore,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState(
        beachWaveStateTrackerStore: beachWaveStateTrackerStore,
        supabase: supabase,
        addNameToDatabaseStore: addNameToDatabaseStore,
        fadingTextStateTrackerStore: fadingTextStateTrackerStore,
        getCollaboratorPhraseStore: getCollaboratorPhraseStore,
      );
}

class _HomeScreenState extends State<HomeScreen> {
  final SupabaseClient supabase;
  final BeachWavesTrackerStore beachWaveStateTrackerStore;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  final SmartFadingAnimatedTextTrackerStore fadingTextStateTrackerStore;
  final GetCollaboratorPhraseStore getCollaboratorPhraseStore;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async {
      await addNameToDatabaseStore(NoParams());
      await getCollaboratorPhraseStore(NoParams()).then((_) {
        fadingTextStateTrackerStore.setMainMessage(
          index: 2,
          thePhrase: getCollaboratorPhraseStore.collaboratorPhrase,
        );
      });
    });
  }

  _HomeScreenState({
    required this.supabase,
    required this.beachWaveStateTrackerStore,
    required this.addNameToDatabaseStore,
    required this.fadingTextStateTrackerStore,
    required this.getCollaboratorPhraseStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (beachWaveStateTrackerStore.isReadyToTransition == true) {
        Modular.to.navigate(
          '/p2p_collaborator_pool/',
          arguments: beachWaveStateTrackerStore.passingParam,
        );
      }
      return LayoutBuilder(
        builder: (context, constraints) {
          return PlatformScaffold(
            body: Swipe(
              onSwipeUp: () =>
                  beachWaveStateTrackerStore.homeScreenSwipeUpCallback(),
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SmartBeachWaves(
                      stateTrackerStore: beachWaveStateTrackerStore,
                    ),
                  ),
                  Center(
                      child: SmartFadingAnimatedText(
                    initialFadeInDelay: const Duration(seconds: 0),
                    stateTrackerStore: fadingTextStateTrackerStore,
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
