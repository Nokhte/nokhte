import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class ArticleContent extends StatelessWidget {
  final String currentInstructionsHeader;
  final List<String> currentInstructionsBody;
  final List<String> currentJustifications;

  final PresetTypes type;
  final PowerupInfo powerUpInformation;
  final double opacity;
  final double currentPosition;

  const ArticleContent({
    super.key,
    required this.currentInstructionsHeader,
    required this.currentInstructionsBody,
    required this.currentJustifications,
    required this.opacity,
    required this.powerUpInformation,
    required this.type,
    required this.currentPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Chivo(
              currentInstructionsHeader,
              fontSize: 27,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RichJostList(
              contentList: currentInstructionsBody,
              isOrdered: true,
            ),
          ),
          DemoPhones(
            type: type,
            currentPosition: currentPosition,
          ),
          PowerupExplanation(
            currentPosition: currentPosition,
            info: powerUpInformation,
            type: type,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Chivo(
              'Reasons:',
              fontSize: 27,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: RichJostList(
              contentList: currentJustifications,
              isOrdered: false,
            ),
          )
        ],
      ),
    );
  }
}
