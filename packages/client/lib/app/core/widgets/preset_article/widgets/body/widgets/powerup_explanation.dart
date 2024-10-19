import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class PowerupExplanation extends HookWidget {
  final double currentPosition;
  final PowerupInfo info;
  final PresetTypes type;

  const PowerupExplanation({
    super.key,
    required this.currentPosition,
    required this.info,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    if (currentPosition.isLessThanOrEqualTo(.5)) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 6.0,
            bottom: 20.0,
          ),
          child: Chivo(
            'Power Up: **${info.name}**',
            fontSize: 27,
          ),
        ),
        Image.asset(
          info.imagePath,
          width: 60,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: TagLine(
            info.tagline,
            useExpandedPadding: false,
            shouldGiveMoreSpaceToTheRight: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 6.0,
            bottom: 10.0,
          ),
          child: Chivo(
            'What it does:',
            fontSize: 27,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: RichJostList(
            contentList: [info.description],
            isOrdered: false,
            horizontalPadding: 40,
          ),
        ),
        DemoPhones(
          type: type,
          showPowerUp: true,
          currentPosition: currentPosition,
        ),
      ]);
    } else {
      return Container();
    }
  }
}
