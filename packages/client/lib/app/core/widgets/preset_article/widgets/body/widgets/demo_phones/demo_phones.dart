// ignore_for_file: unused_import, prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte/app/modules/session/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
export 'movies/movies.dart';
export 'types/types.dart';
export 'widgets/widgets.dart';

class DemoPhones extends HookWidget with RallyConstants {
  final Either<SessionTags, Powerups> demoType;
  final List<SessionTags> allTheTags;

  DemoPhones({
    super.key,
    required this.demoType,
    required this.allTheTags,
  });

  @override
  Widget build(BuildContext context) {
    return demoType.fold(
      (sessionTag) => _buildSessionTagDemo(sessionTag),
      (powerup) => _buildPowerupDemo(powerup),
    );
  }

  Widget _buildSessionTagDemo(SessionTags tag) {
    if (tag == SessionTags.tapToSpeak || tag == SessionTags.holdToSpeak) {
      return GroupSpeakingDemo(allTheTags);
    }
    if (tag == SessionTags.monoFocalNotes) {
      return MonoFocalNotesDemo(allTheTags);
    } else if (tag == SessionTags.multiFocalNotes) {
      return MultiFocalNotesDemo(allTheTags);
    }
    if (tag == SessionTags.flexibleSeating ||
        tag == SessionTags.strictSeating ||
        tag == SessionTags.noSeating) {
      return SeatingDemos(allTheTags);
    }
    return Container();
  }

  Widget _buildPowerupDemo(Powerups powerup) {
    switch (powerup) {
      case Powerups.rally:
        return RallyDemo(allTheTags);
      case Powerups.letEmCook:
        return LetEmCookDemo(allTheTags);
      default:
        return Container();
    }
  }
}
