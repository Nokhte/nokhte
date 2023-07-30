/// movies.dart
///
/// Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 30th, 2023
///
/// Author: Sonny Vesali
///
/// This barrel file exports three movie classes for animations used in the
/// `BreathingPentagonsButton` widget.
///
/// The animations included are:
///   1. [AggressiveExpansion]: Represents an aggressive expansion animation,
///      which involves rotating, expanding, and changing colors of the pentagons.
///   2. [InfiniteSpinner]: Represents an infinite rotation animation, where the
///      pentagons rest on the final color and rotate indefinitely.
///   3. [WindDown]: Represents a wind-down animation, where the pentagons
///      decrease in size and rotate back to the resting position.
///
/// All animations require the following properties, even if they're static:
///   - 'scale'
///   - 'angle'
///   - '1st Pentagon > 1st Gradient Color'
///   - '1st Pentagon > 2nd Gradient Color'
///   - '2nd Pentagon > 1st Gradient Color'
///   - '2nd Pentagon > 2nd Gradient Color'
///   - '3rd Pentagon > 1st Gradient Color'
///   - '3rd Pentagon > 2nd Gradient Color'

export 'breathing_pentagons/aggressive_expansion.dart';
export 'breathing_pentagons/infinite_spinner.dart';
export 'breathing_pentagons/wind_down.dart';
