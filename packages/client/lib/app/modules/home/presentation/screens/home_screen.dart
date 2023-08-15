// home_screen.dart
// ignore_for_file: sized_box_for_whitespace, no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/presentation/mobx/main/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/presentation/widget/beach_waves.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swipe/swipe.dart';

class HomeScreen extends StatefulWidget {
  final SupabaseClient supabase;
  final BeachWavesTrackerStore stateTrackerStore;
  const HomeScreen({
    Key? key,
    required this.supabase,
    required this.stateTrackerStore,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState(
        stateTrackerStore: stateTrackerStore,
        supabase: supabase,
      );
}

class _HomeScreenState extends State<HomeScreen> {
  final SupabaseClient supabase;
  final BeachWavesTrackerStore stateTrackerStore;

  _HomeScreenState({
    required this.supabase,
    required this.stateTrackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // stream: authStateStore.authState,
      builder: (context, constraints) {
        return PlatformScaffold(
          body: Stack(
            children: [
              Swipe(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BeachWaves(
                    size: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                    stateTrackerStore: stateTrackerStore,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
