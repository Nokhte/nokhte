import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class ArticleBodyInfo extends Equatable {
  final PresetTypes presetType;
  final List<String> speakingInstructions;
  final List<String> sittingInstructions;
  final List<String> notesInstructions;
  final List<String> speakingJustifications;
  final List<String> sittingJustifications;
  final List<String> notesJustifications;
  final DemoTypes demoTypes;
  final String title;
  final String tagline;
  final String uniqueFeature;

  ArticleBodyInfo({required this.presetType})
      : speakingInstructions = _getInstructions(presetType, 'speaking'),
        sittingInstructions = _getInstructions(presetType, 'sitting'),
        notesInstructions = _getInstructions(presetType, 'notes'),
        speakingJustifications = _getJustifications(presetType, 'speaking'),
        sittingJustifications = _getJustifications(presetType, 'sitting'),
        title = _getTitle(presetType),
        tagline = _getTagline(presetType),
        uniqueFeature = _getUniqueFeature(presetType),
        notesJustifications = [
          'Write with brevity **(104 characters)**',
          '**Keep** track of ideas'
        ],
        demoTypes = presetType == PresetTypes.collaborative
            ? DemoTypes.multifocal
            : DemoTypes.monofocal;

  static List<String> _getInstructions(PresetTypes type, String context) {
    final collaborative = {
      'speaking': [
        '**Tap** on the yellow side to speak',
        '**Tap again** when you are finished'
      ],
      'sitting': ['**Sit or stand** anywhere', '**Keep** your phone with you'],
      'notes': [
        '**Tap** on the blue to write your note',
        '**Swipe up** to submit'
      ]
    };

    final consultative = {
      'speaking': [
        'Locate the phone **to your right**',
        '**Hold** on the yellow side to speak',
        '**Let go** when you are finished'
      ],
      'sitting': [
        'Sit in a **circle**',
        'Place your phone **halfway** between you and the person to your right'
      ],
      'notes': [
        'Locate the **phone to your left**',
        '**Tap** on the blue to write your note',
        '**Swipe up** to submit'
      ]
    };

    return type == PresetTypes.collaborative
        ? collaborative[context]!
        : consultative[context]!;
  }

  static String _getTitle(PresetTypes type) =>
      type == PresetTypes.collaborative ? 'Collaboration' : 'Consultation';
  static String _getTagline(PresetTypes type) =>
      type == PresetTypes.collaborative
          ? 'Great with smaller groups, and works best in creative endeavors'
          : 'Great for beginners, and groups of any size \n';
  static String _getUniqueFeature(PresetTypes type) => type ==
          PresetTypes.collaborative
      ? 'Flexibility: sit anywhere, notes anytime'
      : 'One at a time: The group is either listening or writing notes, not both.';

  static List<String> _getJustifications(PresetTypes type, String context) {
    final collaborative = {
      'speaking': ['Allows you to do other things **while talking**'],
      'sitting': [
        'Can **move anytime** in the meeting',
        'Can be used in **more spaces**'
      ]
    };

    final consultative = {
      'speaking': [
        'Encourages speaking with **brevity**',
        'Gives you less time to **repeat yourself**'
      ],
      'sitting': ['**See** everyone’s face', '**Hear** people clearly']
    };

    return type == PresetTypes.collaborative
        ? collaborative[context]!
        : consultative[context]!;
  }

  @override
  List<Object> get props => [
        speakingInstructions,
        sittingInstructions,
        notesInstructions,
        speakingJustifications,
        sittingJustifications,
        notesJustifications,
        demoTypes,
      ];
}
