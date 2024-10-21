import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

class ArticleBodyInfo extends Equatable {
  final PresetTypes presetType;
  final List<SessionTags> presetTags;
  final List<String> speakingInstructions;
  final List<String> sittingInstructions;
  final List<String> notesInstructions;
  final List<String> speakingJustifications;
  final List<String> sittingJustifications;
  final List<String> notesJustifications;

  final String title;
  final String tagline;
  final String uniqueFeature;
  final PowerupInfo powerup;

  ArticleBodyInfo({
    required this.presetTags,
    required this.presetType,
  })  : speakingInstructions = _getSpeakingInstructions(presetTags),
        sittingInstructions = _getSittingInstructions(presetTags),
        notesInstructions = _getNotesInstructions(presetTags),
        speakingJustifications = _getSpeakingJustifications(presetTags),
        sittingJustifications = _getSittingJustifications(presetTags),
        notesJustifications = _getNotesJustifications(presetTags),
        title = _getTitle(presetType),
        tagline = _getTagline(presetType),
        uniqueFeature = _getUniqueFeature(presetType),
        powerup = PowerupInfo(
          presetType == PresetTypes.collaborative
              ? Powerups.letEmCook
              : Powerups.rally,
        );

  static List<String> _getSpeakingInstructions(List<SessionTags> tags) {
    if (tags.contains(SessionTags.tapToSpeak)) {
      return [
        '**Tap** on the yellow side to speak',
        '**Tap again** when you are finished'
      ];
    } else if (tags.contains(SessionTags.holdToSpeak)) {
      return [
        'Locate the phone **to your right**',
        '**Hold** on the yellow side to speak',
        '**Let go** when you are finished'
      ];
    }
    return [];
  }

  static List<String> _getSittingInstructions(List<SessionTags> tags) {
    if (tags.contains(SessionTags.flexibleSeating)) {
      return ['**Sit or stand** anywhere', '**Keep** your phone with you'];
    } else if (tags.contains(SessionTags.strictSeating)) {
      return [
        'Sit in a **circle**',
        'Place your phone **halfway** between you and the person to your right'
      ];
    } else if (tags.contains(SessionTags.noSeating)) {
      return ['No specific seating arrangement required'];
    }
    return [];
  }

  static List<String> _getNotesInstructions(List<SessionTags> tags) {
    List<String> instructions = [
      '**Tap** on the blue to write your note',
      '**Swipe up** to submit'
    ];
    if (tags.contains(SessionTags.monoFocalNotes)) {
      instructions.insert(0, 'Locate the **phone to your left**');
    }
    return instructions;
  }

  static List<String> _getSpeakingJustifications(List<SessionTags> tags) {
    if (tags.contains(SessionTags.tapToSpeak)) {
      return ['Allows you to do other things **while talking**'];
    } else if (tags.contains(SessionTags.holdToSpeak)) {
      return [
        'Encourages speaking with **brevity**',
        'Gives you less time to **repeat yourself**'
      ];
    }
    return [];
  }

  static List<String> _getSittingJustifications(List<SessionTags> tags) {
    if (tags.contains(SessionTags.flexibleSeating)) {
      return [
        'Can **move anytime** in the meeting',
        'Can be used in **more spaces**'
      ];
    } else if (tags.contains(SessionTags.strictSeating)) {
      return ["**See** everyone's face', '**Hear** people clearly"];
    }
    return [];
  }

  static List<String> _getNotesJustifications(List<SessionTags> tags) {
    return [
      'Write with brevity **(104 characters)**',
      '**Keep** track of ideas'
    ];
  }

  static String _getTitle(PresetTypes type) {
    switch (type) {
      case PresetTypes.collaborative:
        return 'Collaboration';
      case PresetTypes.consultative:
        return 'Consultation';
      case PresetTypes.solo:
        return 'Solo';
      default:
        throw ArgumentError('Unsupported preset type: $type');
    }
  }

  static String _getTagline(PresetTypes type) {
    switch (type) {
      case PresetTypes.collaborative:
        return 'Great with smaller groups, and works best in creative endeavors';
      case PresetTypes.consultative:
        return 'Great for beginners, and groups of any size \n';
      case PresetTypes.solo:
        return 'Use the app in group settings without group approval \n'; // Empty for now
      default:
        throw ArgumentError('Unsupported preset type: $type');
    }
  }

  static String _getUniqueFeature(PresetTypes type) {
    switch (type) {
      case PresetTypes.collaborative:
        return 'Flexibility: sit anywhere, notes anytime';
      case PresetTypes.consultative:
        return 'One at a time: The group is either listening or writing notes, not both.';
      case PresetTypes.solo:
        return 'Adaptive: Change the session to fit your needs '; // Empty for now
      default:
        throw ArgumentError('Unsupported preset type: $type');
    }
  }

  @override
  List<Object> get props => [
        speakingInstructions,
        sittingInstructions,
        notesInstructions,
        speakingJustifications,
        sittingJustifications,
        notesJustifications,
      ];
}
