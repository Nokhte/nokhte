// home_screen.dart
// ignore_for_file: sized_box_for_whitespace, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/main/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/widgets/smart_beach_waves.dart';
import 'package:primala/app/modules/home/presentation/mobx/main/add_name_to_database_store.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swipe/swipe.dart';

class HomeScreen extends StatefulWidget {
  final SupabaseClient supabase;
  final BeachWavesTrackerStore stateTrackerStore;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  const HomeScreen({
    Key? key,
    required this.supabase,
    required this.stateTrackerStore,
    required this.addNameToDatabaseStore,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState(
        stateTrackerStore: stateTrackerStore,
        supabase: supabase,
        addNameToDatabaseStore: addNameToDatabaseStore,
      );
}

class _HomeScreenState extends State<HomeScreen> {
  final SupabaseClient supabase;
  final BeachWavesTrackerStore stateTrackerStore;
  final AddNameToDatabaseStore addNameToDatabaseStore;

  @override
  void initState() {
    super.initState();
    addNameToDatabaseStore(NoParams());

    /// do the name additions here
  }

  _HomeScreenState({
    required this.supabase,
    required this.stateTrackerStore,
    required this.addNameToDatabaseStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (stateTrackerStore.isReadyToTransition == true) {
        Modular.to.navigate(
          '/p2p_collaborator_pool/',
          arguments: stateTrackerStore.passingParam,
        );
      }
      return LayoutBuilder(
        builder: (context, constraints) {
          return PlatformScaffold(
            body: Stack(
              children: [
                Swipe(
                  onSwipeDown: () async => await supabase.auth.signOut(),
                  onSwipeUp: () =>
                      stateTrackerStore.homeScreenSwipeUpCallback(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SmartBeachWaves(
                      stateTrackerStore: stateTrackerStore,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
